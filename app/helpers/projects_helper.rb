module ProjectsHelper
  def liked?(project)
    like = project.likes.find_by(user_id: current_user.id)
    return [true, like.id] if like != nil
    [false, 0]
  end

  def favourite?(project)
    favourite = project.favourites.find_by(user_id: current_user.id)
    return [true, favourite.id] if favourite != nil
    [false, 0]
  end

  def favourite_projects
    favourites = Favourite.where(user_id: current_user.id)
    projects = []
    favourites.each do |fav|
      projects.push(fav.project)
    end
    projects
  end

  def number_of_likes(project)
    project.likes.count
  end

  def project_sorted_by(argument)
    case argument
    when 'ancient' || ''
      return Project.all
    when 'recent'
      return Project.all.reverse
    when 'most_liked'
      hash = group_likes_by_project.sort_by {|k, v| -v}
      create_right_order_of_display(hash)
    when 'least_liked'
      hash = group_likes_by_project.sort_by {|k, v| v}
      create_right_order_of_display(hash)
    end
  end

  def group_likes_by_project
    likes = Like.all
    hash = {}
    Project.all.length.times do |index|
      hash[index + 1] = 0
    end
    likes.each do |like|
      hash[like.project_id] += 1
    end
    hash
  end

  def create_right_order_of_display(hash)
    result = []
    hash.each_with_index do |like, index|
      result.push(Project.find(hash[index][0]))
    end
    result
  end
end
