Rails.application.routes.draw do

  # resources :students
  resources :students do
  collection do
      match 'search' => 'students#search', via: [:get, :post], as: :search
    end
  end
  resources :student_types
  resources :student_categories
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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