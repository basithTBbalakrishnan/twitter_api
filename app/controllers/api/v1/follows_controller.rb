class Api::V1::FollowsController < ApplicationController
  
  before_action :authenticate_user  
  after_action :update_user_followed_list, only: [:create]
  after_action :delete_followers_when_unfollow, only: [:unfollow]
  
  def new
    
  end
  
  def create
   @follow = Follow.new(follow_params)
   user = User.find(params[:follow][:user_id])
   user_followers = user.follows.pluck(:user_follower_id)
   unless user_followers.include?(params[:follow][:user_follower_id]) 
    result =  (@follow.save) ? "you followed the user" :  "Error accured"
    render json: result  
   else
     render json: "You are already following the user" 
   end  
    
  end  

  
  def unfollow
    @status = Follow.destroy.where(user_id: params[:id])
  end
  
  
  
  private
   
  def follow_params
    params.require(:follow).permit(:user_id,:user_follower_id)
  end 
  
  def update_user_followed_list
   user = User.find(params[:follow][:user_id])
   Followed.create(user_id: params[:follow][:user_follower_id],username: user.username,followed: params[:follow][:user_id]) 
  end
  
  def delete_followers_when_unfollow
   @status = Follow.destroy.where(user_id: params[:user_follower_id])
  end
  
end
