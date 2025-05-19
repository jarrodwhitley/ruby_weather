class SessionsController < ApplicationController
  def new
  end

  def create
    # Find user by email or username
    user = User.find_by(email: params[:login]) ||
           User.find_by(username: params[:login])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid login credentials"

      # Render only the frame instead of the full page
      render turbo_stream: turbo_stream.replace(
        "login_form",
        partial: "sessions/form",
        locals: { error: "Invalid login credentials" }
      ), status: :unprocessable_entity
    end
  end

  def destroy
    Rails.logger.debug "Destroy action called"
    session[:user_id] = nil
    redirect_to twitter_path, notice: "Logged out successfully!"
  end
end
