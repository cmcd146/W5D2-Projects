class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  def logged_in?
    !!current_user
  end
  
  def login(user)
    user.reset_session_token
    session[:session_token] = user.session_token 
  end
  
  def logout
    current_user.reset_session_token
    session[:session_token] = nil
  end
  
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

end