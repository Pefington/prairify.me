module SearchHelper
  def get_place(place)
    place_url = "https://api.inaturalist.org/v1/search?q=#{place}&sources=places&per_page=1"
    if HTTParty.get(place_url)['total_results'] == 0
      place_url = "https://api.inaturalist.org/v1/search?q=#{place}&per_page=1"
      if HTTParty.get(place_url)['total_results'] != 0
        place_record = HTTParty.get(place_url)['results'][0]
        place_name = find_place_name_in_inat(place_record)
        place_id = place_record['record']['id']
        return [place_name, place_id] if !place_id.nil? && !place_name.nil?
        nil
      end
    else
      place_record = HTTParty.get(place_url)['results'][0]
      place_name = find_place_name_in_inat(place_record)
      place_id = place_record['record']['id']
      return [place_name, place_id] if !place_id.nil? && !place_name.nil?
      nil
    end
  end

  def get_data(place_id)
    return nil if place_id.nil?

    obs_url = "https://api.inaturalist.org/v1/observations/species_counts?identified=true&taxon_is_active=true&place_id=#{place_id}&iconic_taxa=Plantae&identifications=most_agree"
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
      hash_data[:scientific_name] = obs['taxon']['name'] unless obs['taxon']['name'].nil?
      hash_data[:wiki] = obs['taxon']['wikipedia_url'] unless obs['taxon']['wikipedia_url'].nil?
      unless obs['taxon']['default_photo']['medium_url'].nil?
        hash_data[:picture_url] =
          obs['taxon']['default_photo']['medium_url']
      end
      results.push(hash_data)
    end
    results
  end

  def usable_url(str)
    str = str.gsub(/[!@%&"]/, '').gsub('-', ' ')
    ERB::Util.url_encode(str)
  end

  def find_place_name_in_inat(place_record)
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

  def get_place_with_loc(coord)
    long = coord.split(',')[0]
    lat = coord.split(',')[1]
    place_url = "https://api.inaturalist.org/v1/places/nearby?nelat=#{long}&nelng=#{lat}&swlat=#{long}&swlng=#{lat}"
    if !HTTParty.get(place_url)['results']['community'].last.nil?
      inat_result = HTTParty.get(place_url)['results']['community'].last
    elsif !HTTParty.get(place_url)['results']['standard'].last.nil?
      inat_result = HTTParty.get(place_url)['results']['standard'].last
    end
    place_name = find_place_name_in_inat(inat_result)
    place_id = inat_result['id']
    [place_name, place_id] if !place_id.nil? && !place_name.nil?
  end
end
