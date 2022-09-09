module ProjectsHelper
  def liked?(project)
    like = project.likes.find_by(user_id:current_user.id)
    return [true, like.id] if like != nil
    [false, 0]
  end

  def favourite?(project)
    favourite = project.favourites.find_by(user_id:current_user.id)
    return [true, favourite.id] if favourite != nil
    [false, 0]
  end
end
