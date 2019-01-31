class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(session_params[:username], session_params[:password])
    if user
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    else
      flash[:errors] = ["Error, Username and/or password mismatch"]
      redirect_to new_session_url # render json: "Error, Username and/or password mismatch"
    end
  end

  def session_params
    params.require(:session).permit(:username, :password)
  end

  def destroy
    debugger
    user = current_user
    user.reset_session_token! if user
    session[:session_token] = nil

    redirect_to cats_url
  end


end