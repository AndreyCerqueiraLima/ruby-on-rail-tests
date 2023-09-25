Rails.application.routes.draw do
  resources :categories

  root to: "home#index"

  draw :api

  use_doorkeeper
  devise_for :users
  devise_scope :user do

    get 'admin/dashboard'
    get 'admin/company_dashboard'
    get 'admin/user_dashboard'

    resources :companies, path: 'admin/companies' do
      resources :users, module: :companies
      resources :products, module: :companies
    end

    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html




  # Defines the root path route ("/")
  # root "articles#index"
end
