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
      hash = {}
      likes = Like.all
      likes.each do |like|
        if hash[:like.project_id] == nil
          hash[:like.project_id] = 1
        else
          hash[:like.project_id] += 1
        end
      end
      hash.sort_by {|k, v| -v}
      result = []
      hash.each_with_index do |like, index|
        result.push(Project.find_by(id:hash[index][0]))
      end
      return result
    when 'least_liked'
      hash = {}
      likes = Like.all
      likes.each do |like|
        if hash[:like.project_id] == nil
          hash[:like.project_id] = 1
        else
          hash[:like.project_id] += 1
        end
      end
      hash.sort_by {|k, v| v}
      result = []
      hash.each_with_index do |like, index|
        result.push(Project.find_by(id:hash[index][0]))
      end
      return result
    end

  end

end
