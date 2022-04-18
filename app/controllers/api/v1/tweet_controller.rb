class Api::V1::TweetController < ApplicationController
  
 
 before_action :authenticate_user
 
 def user_tweets     
   user = User.find(params[:id])
   user_tweets = user.tweets
   render json: user_tweets
 end
 
 
 def show
   
 end
 
 def create
  @tweet = Tweet.new(tweet_params)  
  if @tweet.save 
   render json: "Tweet saved successfully"
  else 
   render json: "Tweet Not saved"
  end 
 end
 
 
 
 def user_followers_tweet
   user = User.find(params[:id])
   user_followers = user.follows.pluck(:user_follower_id)
   user_follower_tweets = Tweet.where("user_id IN(?)", user_followers).order('created_at DESC')
   render json: user_follower_tweets
 end

 private

 def tweet_params
   params.require(:tweet).permit(:user_id,:tweet)
 end
 
end
