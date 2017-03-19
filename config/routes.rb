Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  

  resources :plans do 
  	resources :comments, :controller => 'plan_comments'
    resources :donations, :controller => 'plan_donations'
  	collection do
      get :latest
    end
    member do 
    	post :follow
    	post :unfollow
    end
  end

  get"/home", to:"home#homepage", :controller => 'home'
  get"/about", to:"home#about", :controller => 'home'
  get"/how_it_works", to:"home#works", :controller => 'home'

  root "home#homepage"
end
