class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_username(params[:username])
    if user
      session[:username] = user.username
      redirect_to users_path, notice: 'Logged in!'

    else
      flash.now[:alert] = 'Email or password is invalid'
      redirect_to new_session_path
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path, notice: 'Logged out!'
  end
end
