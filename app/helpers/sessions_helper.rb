module SessionsHelper

  def current_user
    User.find_by(id: session[:user_id])
  end

  def log_in(current_user)
    session[:user_id] = current_user.id
  end
end


