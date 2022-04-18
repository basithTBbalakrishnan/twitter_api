class UsersController < ApplicationController
  #before_action :authenticate_user!
  after_action :create_user_api_token, only: [:create]
  
  
  def create
    @user = User.new(user_params)
      if @user.save
       render json: "User saved successfully"
      else
       render json: "User is not saved try again" 
      end
  end
  
  private
  
  
  def user_params
    params.require(:user).permit(:username,:password,:email)
  end
  
  
  def create_user_api_token
    user = User.find_by_email(params[:user][:email])
    user_token = User.generate_jwt_token(user[:id])
    user.update_attribute(:user_token,user_token)
  end
  
end
