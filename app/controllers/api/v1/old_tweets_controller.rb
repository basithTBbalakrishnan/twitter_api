class Api::V1::TweetsController < ApplicationController

 before_action :authenticate_user


 def create
  @tweet = Tweet.new(tweet_params)  
  if @tweet.save 
   render json: "Tweet saved successfully"
  else 
   render json: "Tweet Not saved"
  end 
 end



private

 def tweet_params
   params.require(:tweet).permit(:user_id,:tweet)
 end

end
