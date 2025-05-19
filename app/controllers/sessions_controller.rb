class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:login]) || User.find_by(username: params[:login])

    if user && user.authenticate(params[:password])
      # Authentication successful
      session[:user_id] = user.id
      redirect_to twitter_path # Always redirect after successful login
    else
      # Authentication failed - IMPORTANT: still redirect instead of render
      flash[:alert] = "Invalid email/username or password"
      redirect_to request.referer || login_path # Redirect back or to login path
    end
  end

  def destroy
    Rails.logger.debug "Destroy action called"
    session[:user_id] = nil
    redirect_to twitter_path, notice: "Logged out successfully!"
  end
end
