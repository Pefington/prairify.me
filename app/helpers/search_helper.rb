module SearchHelper

  def get_place(place)
    place_url = "https://api.inaturalist.org/v1/search?q=#{place.gsub(" ", "%20")}&sources=places&per_page=1"
    place_data = JSON.load(URI.open(place_url))['results'][0]
    if place_data != nil
      if place_data['matches'] != nil
        return [place_data['matches'].join(" "), place_data['matches']['id']]
      elsif place_data['record'] != nil
        return [place_data['record']['display_name'], place_data['record']['id']]
      else
        nil
      end
    else
      nil
    end
  end

  def get_place_name(place)
    if get_place(place) != nil
      get_place(place)[0]
    else
      nil
    end
  end

  def get_place_id(place)
    if get_place(place) != nil
      get_place(place)[1]
    else
      nil
    end
  end

  def get_data(place, number_of_elements)
    place_id = get_place_id(place)
    return nil if place_id == nil
    taxa_url = "https://api.inaturalist.org/v1/taxa?is_active=true&taxon_id=47126&rank_level=20&per_page=#{number_of_elements}&preferred_place_id=#{place_id}&all_names=true"
    taxa_data = JSON.load(URI.open(taxa_url))['results']
    results = []
    taxa_data.size.times do |index|
      hash_data = {}
      hash_data[:id] = taxa_data[index]["id"]
      hash_data[:common_name] = taxa_data[index]["preferred_common_name"].capitalize
      hash_data[:scientific_name] = taxa_data[index]["name"]
      hash_data[:wiki] = taxa_data[index]["wikipedia_url"]
      hash_data[:picture_url] = taxa_data[index]["default_photo"]["medium_url"]
      results.push(hash_data)
    end
    results
  end

end
