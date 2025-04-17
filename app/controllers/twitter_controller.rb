class TwitterController < ApplicationController
  before_action :require_login, only: [ :create ]

  def index
    @tweets = Tweet.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      flash[:notice] = "Tweet posted successfully!"
    else
      flash[:alert] = "Failed to post tweet."
    end
    redirect_to twitter_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def require_login
    unless current_user
      flash[:alert] = "You must be logged in to access Twitter."
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
