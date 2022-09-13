module SearchHelper
  def get_place(place)
    place_url = "https://api.inaturalist.org/v1/search?q=#{place}&sources=places&per_page=1"
    place_record = HTTParty.get(place_url)['results'][0]['record']
    [place_record['display_name'], place_record['id']] if !place_record.nil? && !place_record['display_name'].nil?
  end

  def get_place_name(place)
    get_place(place)[0] unless get_place(place).nil?
  end

  def get_place_id(place)
    get_place(place)[1] unless get_place(place).nil?
  end

  def get_data(place)
    place_id = get_place_id(place)
    return nil if place_id.nil?

    obs_url = "https://api.inaturalist.org/v1/observations/species_counts?identified=true&taxon_is_active=true&place_id=#{place_id}&iconic_taxa=Plantae&identifications=most_agree"
    observations = HTTParty.get(obs_url)['results']
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
    results
  end

  def usable_url(str)
    str = str.gsub(/[!@%&"]/,'').gsub('-', ' ')
    ERB::Util.url_encode(str)
  end

end
