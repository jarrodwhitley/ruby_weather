class SessionsController < ApplicationController
  def new
  end

  def create
    # Find the user by email or username
    user = User.find_by("email = :login OR username = :login", login: params[:login])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to twitter_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email/username or password."
      render :new
    end
  end

  def destroy
    Rails.logger.debug "Destroy action called"
    session[:user_id] = nil
    redirect_to twitter_path, notice: "Logged out successfully!"
  end
end
