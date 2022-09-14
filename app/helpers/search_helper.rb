module SearchHelper
  def get_place(place)
    place_url = "https://api.inaturalist.org/v1/search?q=#{place}&sources=places&per_page=1"
    puts 'place_url'
    puts place_url
    if HTTParty.get(place_url)['total_results'] != 0
      place_record = HTTParty.get(place_url)['results'][0]
      puts 'place_record'
      puts place_record
      if !place_record['matches'].nil?
        place_name = place_record['matches'].join(' ')
      elsif !place_record['display_name'].nil?
        place_name = place_record['display_name']
      elsif !place_record['display_name_autocomplete'].nil?
        place_name = place_record['display_name_autocomplete']
      elsif !place_record['slug'].nil?
        place_name = place_record['slug']
      elsif !place_record['record']['matches'].nil?
        place_name = place_record['record']['matches']
      elsif !place_record['record']['display_name'].nil?
        place_name = place_record['record']['display_name']
      elsif !place_record['record']['display_name_autocomplete'].nil?
        place_name = place_record['record']['display_name_autocomplete']
      elsif !place_record['record']['slug'].nil?
        place_name = place_record['record']['slug']
      else
        nil
      end
        return [place_name, place_record['record']['id']] if !place_record.nil? && !place_record['matches'].nil? && !place_name.nil?
        nil
      else
        nil
      end
    end
  end

  def get_place_name(place)
    get_place(place)[0] unless get_place(place).nil?
  end

  def get_place_id(place)
    get_place(place)[1] unless get_place(place).nil?
  end

  def get_data(place)
    place_id = get_place_id(place)
    puts 'place_id'
    puts place_id
    return nil if place_id.nil?
    obs_url = "https://api.inaturalist.org/v1/observations/species_counts?identified=true&taxon_is_active=true&place_id=#{place_id}&iconic_taxa=Plantae&identifications=most_agree"
    puts 'obs_url'
    puts obs_url
    observations = HTTParty.get(obs_url)['results']
    puts 'observations'
    puts observations
    results = []
    observations.each do |obs|
      hash_data = {}
      hash_data[:id] = obs['taxon']['id']
      unless obs['taxon']['preferred_common_name'].nil?
        hash_data[:common_name] =
          obs['taxon']['preferred_common_name'].capitalize
      end
      hash_data[:scientific_name] = obs['taxon']['name']
      hash_data[:wiki] = obs['taxon']['wikipedia_url']
      hash_data[:picture_url] = obs['taxon']['default_photo']['medium_url']
      results.push(hash_data)
    end
    puts 'results'
    puts results
    results
  end

  def usable_url(str)
    str = str.gsub(/[!@%&"]/, '').gsub('-', ' ')
    puts 'ERB::Util.url_encode(str)'
    puts ERB::Util.url_encode(str)
    ERB::Util.url_encode(str)
  end
end
