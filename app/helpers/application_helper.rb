module ApplicationHelper
  def feed_user
    if params[:id]
      User.find(params[:id])
    elsif params[:user_id]
      User.find(params[:user_id])
    else
      current_user
    end
  end

  def friends(user)
    user.friends.includes(:profile) + user.inverse_friends.includes(:profile)
  end
end
