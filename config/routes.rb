Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  get 'home/index'
  root "home#index"
  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new'
    get 'sign_out', :to => 'devise/sessions#destroy'
  end

  devise_scope :user do
    post 'social_info'=> 'users/omniauth_callbacks#social_info'
  end

end