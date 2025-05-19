class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # Registration successful
      session[:user_id] = @user.id
      redirect_to twitter_path, notice: "Account created successfully!"
    else
      # Registration failed - redirect back instead of rendering template
      flash[:alert] = @user.errors.full_messages.to_sentence
      redirect_to request.referer || register_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
