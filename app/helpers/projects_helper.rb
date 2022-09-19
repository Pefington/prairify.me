module ProjectsHelper
  def transfer_plants(project)
    selected_plants = SelectedPlant.where(user_id: current_user.id)
    selected_plants.each do |plant|
      Plant.create(inaturalist_id: plant.inaturalist_id,
                   common_name: plant.common_name,
                   english_name: plant.english_name,
                   scientific_name: plant.scientific_name,
                   wiki: plant.wiki,
                   picture_url: plant.picture_url,
                   project_id: project.id)
    end
    SelectedPlant.where(user_id: current_user.id).destroy_all
  end

  # Returns true if a project is liked by the current user and false otheriwse
  def liked?(project)
    like = project.likes.find_by(user_id: current_user.id)
    return [true, like.id] unless like.nil?
    
    [false, 0]
  end

  # Returns true if a project is favourited by the current user and false otheriwse
  def favourite?(project)
    favourite = project.favourites.find_by(user_id: current_user.id)
    return [true, favourite.id] unless favourite.nil?

    [false, 0]
  end

  # Returns an array of all the projects the current user has as favourites
  def favourite_projects
    favourites = Favourite.where(user_id: current_user.id)
    projects = []
    favourites.each do |fav|
      projects.push(fav.project)
    end
    projects
  end

  # Returns the number of likes a project currently has
  def number_of_likes(project)
    project.likes.count
  end

  # Gets in what way the user wants to display projects and then calls up the right method.
  def project_sorted_by(argument)
    case argument
    when 'ancient' || ''
      Project.all
    when 'recent'
      Project.all.reverse
    when 'most_liked'
      hash = group_likes_by_project.sort_by { |_k, v| -v }
      create_right_order_of_display(hash)
    when 'least_liked'
      hash = group_likes_by_project.sort_by { |_k, v| v }
      create_right_order_of_display(hash)
    end
  end

  # Returns a hash that has projects as keys and the number of likes as values
  def group_likes_by_project
    likes = Like.all
    hash = {}
    projects = Project.all
    projects.each do |project|
      hash[project.id] = 0
    end
    likes.each do |like|
      hash[like.project_id] += 1
    end
    hash
  end

  # Creates an array of Projects sorted by the number of likes.
  # It could be with the highest number of likes to the least or the other
  # way arround depending on the hash one gives as an argument.
  def create_right_order_of_display(hash)
    result = []
    hash.each_with_index do |_like, index|
      result.push(Project.find(hash[index][0]))
    end
    result
  end
end
