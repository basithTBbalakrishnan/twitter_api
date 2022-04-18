class Api::V1::FollowedController < ApplicationController
  
  before_action :authenticate_user
  
  def create
    @followed = Followed.new(followed_params)
    if @followed.save
      render json: "saved followed user"
    else
      render json: "Not saved followed user"
    end  
  end
  
  
  def user_followers 
   user = User.find(params[:id])  
   user_followeds = user.followeds
   render json: user_followeds 
  end
  
  
  private
  
  def followed_params
    params.require(:followed).permit(:username,:user_id)
  end
  
  
  
end
