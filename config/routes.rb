require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV['PASSWORD_ADMIN'] && password == ENV['PASSWORD_ADMIN']
  end

  mount Sidekiq::Web => '/sidekiq'

  root 'items#index'

  get 'login' => 'authentication#login'
  post 'authenticate' => 'authentication#authenticate'
  get 'logout' => 'authentication#logout'

  resources :items, only: [:index, :new, :create] do
    collection do
      get :archive
      post :bulk_notify
    end

    member do
      post :return
      post :notify
    end
  end
end
