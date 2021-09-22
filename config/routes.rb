Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: :show
      resources :subscriptions, only: :create
    end
  end
end
