namespace :api do
  namespace :v1 do
    scope :users, module: :users do
      post '/', to: "registrations#create", as: :user_registration
    end
    resources :companies
  end
end
scope :api do
  scope :v1 do
    use_doorkeeper do
      skip_controllers :applications, :authorized_applications, :authorizations
    end
  end
end