Rails.application.routes.draw do
  
  namespace :api do
   namespace :v1 do 
    devise_for :users, controllers: { sessions: :sessions },
                       path_names: { sign_in: :login }
      
    resources :tweet, only: [:create]
    resources :follows
    
    get'tweet/user_tweets', to: 'tweet#user_tweets' , as: 'user_tweets'
    get'tweet/user_follower_tweets', to: 'tweet#user_followers_tweet' , as: 'user_followers_tweet'
    get'followeds/user_followers', to: 'followed#user_followers' , as: 'user_followers'
   end
  end
  
  resources :users
 
end
