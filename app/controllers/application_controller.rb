class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    curr_token = session[:session_token]
    User.find_by(session_token: curr_token)
  end

end
