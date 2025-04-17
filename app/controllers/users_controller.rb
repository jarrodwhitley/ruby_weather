class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # Log the user in after registration
      redirect_to twitter_path, notice: "Account created successfully!"
    else
      flash.now[:alert] = "There was an error creating your account."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
