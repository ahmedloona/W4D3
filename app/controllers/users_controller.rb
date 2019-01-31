class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.new
    user.username = user_params[:username]
    user.password = user_params[:password]
    user.save!
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end