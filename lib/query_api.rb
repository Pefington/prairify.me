module QueryApi
  # Fetches the data of iNaturalist by giving it the name of a place.
  # We first try to get data by giving the argument that we are looking for a place
  # but we then try to expand the search to all of iNaturalist database to make sure
  # we didn't miss a less known place.
  # This method then calls get_place_name_and_id_from_inat in order to get
  # the id and the right name according to iNaturalist.
  def self.get_place_with_name(place)
    place_record = nil
    place = usable_url(place)
    place_url = "https://api.inaturalist.org/v1/search?q=#{place}&sources=places"
    if (HTTParty.get(place_url)['total_results']).zero?
      place_url = "https://api.inaturalist.org/v1/search?q=#{place}"
      if HTTParty.get(place_url)['total_results'] != 0
        HTTParty.get(place_url)['results'].each_with_index do |result, _index|
          place_record = result['record'] if result['record']['slug'].start_with?(place)
          break if result['record']['slug'].start_with?(place)
        end
        get_place_name_and_id_from_inat(place_record)
      end
    else
      HTTParty.get(place_url)['results'].each_with_index do |result, _index|
        place_record = result['record'] if result['record']['slug'].start_with?(place)
        break if result['record']['slug'].start_with?(place)
      end
      get_place_name_and_id_from_inat(place_record)
    end
  end

  # Gets the id and name of a place in iNaturalist once we know if we're looking
  # in the places of iNaturalist or in all of its databases.
  def self.get_place_name_and_id_from_inat(place_record)
    return nil if place_record.nil?

    place_name = find_place_name_in_inat(place_record)
    place_id = place_record['id']
    return [place_name, place_id] if !place_id.nil? && !place_name.nil?

    nil
  end

  # Gets the different plants that were recorded in a specific place on iNaturalist.
  # This method needs an iNaturalist place id in order to work. This is provided by
  # the method get_place_with_name or get_place_with_loc
  def self.get_taxa_from_place_id(place_id)
    return nil if place_id.nil?

    obs_url = "https://api.inaturalist.org/v1/observations/species_counts?identified=true&photos=true&taxon_is_active=true&place_id=#{place_id}&iconic_taxa=Plantae&identifications=most_agree&locale=fr&preferred_place_id=#{place_id}"
    return nil if HTTParty.get(obs_url)['error'] == 'Error'

    observations = HTTParty.get(obs_url)['results']
    results = []
    observations.each do |obs|
      hash_data = {}
      hash_data[:id] = obs['taxon']['id'] unless obs['taxon']['id'].nil?
      unless obs['taxon']['preferred_common_name'].nil?
        hash_data[:common_name] =
          obs['taxon']['preferred_common_name'].capitalize
      end
      unless obs['taxon']['english_common_name'].nil?
        hash_data[:english_name] =
          obs['taxon']['english_common_name'].capitalize
      end
      hash_data[:scientific_name] = obs['taxon']['name'] unless obs['taxon']['name'].nil?
      hash_data[:wiki] = obs['taxon']['wikipedia_url'] unless obs['taxon']['wikipedia_url'].nil?
      unless obs['taxon']['default_photo'].nil? || obs['taxon']['default_photo']['medium_url'].nil?
        hash_data[:picture_url] =
          obs['taxon']['default_photo']['medium_url']
      end
      results.push(hash_data)
    end
    results
  end

  # Gets the name that iNaturalist gives to a place. There are different iNaturalist fields that could
  # give us the answer we are looking for so this method looks into all these fields one after the other
  # and stops once one of the field is not empty.
  def self.find_place_name_in_inat(place_record)
    if !place_record['matches'].nil?
      place_record['matches'].join(' ')
    elsif !place_record['display_name'].nil?
      place_record['display_name']
    elsif !place_record['name'].nil?
      place_record['name']
    elsif !place_record['display_name_autocomplete'].nil?
      place_record['display_name_autocomplete']
    elsif !place_record['slug'].nil?
      place_record['slug']
    elsif !place_record['record']['matches'].nil?
      place_record['record']['matches'].join(' ')
    elsif !place_record['record']['display_name'].nil?
      place_record['record']['display_name']
    elsif !place_record['record']['name'].nil?
      place_record['record']['name'].join(' ')
    elsif !place_record['record']['display_name_autocomplete'].nil?
      place_record['record']['display_name_autocomplete']
    elsif !place_record['record']['slug'].nil?
      place_record['record']['slug']
    end
  end

  # Gets the more precise location that iNaturalist could find by giving it coords.
  # Sometimes the results can be found in 'standard' and sometimes in 'community', that's
  # why this method tries to fetch data in both these places.
  # This method then calls get_place_name_and_id_from_inat in order to get
  # the id and the right name according to iNaturalist.
  def self.get_place_with_loc(coord)
    long = coord.split(',')[0]
    lat = coord.split(',')[1]
    place_url = "https://api.inaturalist.org/v1/places/nearby?nelat=#{long}&nelng=#{lat}&swlat=#{long}&swlng=#{lat}"
    if !HTTParty.get(place_url)['results']['community'].last.nil?
      place_record = HTTParty.get(place_url)['results']['community'].last
    elsif !HTTParty.get(place_url)['results']['standard'].last.nil?
      place_record = HTTParty.get(place_url)['results']['standard'].last
    end
    get_place_name_and_id_from_inat(place_record)
  end

  # Transform a query into a usable piece of url.
  # Spaces, special characters and so on have a unique way of being handled by browsers
  # and we need to tranforme them in a readable string.
  def self.usable_url(str)
    str = I18n.transliterate(str.strip.squish)
    str.gsub(/[!@%&"]/, '').gsub(' ', '-').gsub("'", '-').downcase
  end
end
