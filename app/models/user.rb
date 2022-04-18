class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
   has_many :tweets
   has_many :follows      
   has_many :followeds

     
  



  def self.generate_jwt_token(user_id)  
   token = JWT.encode({ id: user_id,
   exp: 60.days.from_now.to_i },
   Rails.application.secrets.secret_key_base)
   token
 end

         
end
