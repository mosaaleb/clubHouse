module PostsHelper
  def authenticate
    if !signed_in?
      redirect_to new_session_path
    end
  end
  
  def signed_in?
    current_user
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies.permanent[:token])
  end
end
