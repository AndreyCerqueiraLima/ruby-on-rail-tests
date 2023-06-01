Rails.application.routes.draw do

  root to: "home#index"

  draw :api

  use_doorkeeper
  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  resources :companies, path: 'admin/companies' do
    resources :users, module: :companies
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
