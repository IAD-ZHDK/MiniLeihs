require 'sidekiq/web'

Rails.application.routes.draw do
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV['AUTH_USERNAME'] && password == ENV['AUTH_PASSWORD']
  end if Rails.env.production?
  mount Sidekiq::Web => '/sidekiq'

  root 'root#index'

  get 'login' => 'root#login'
  post 'authenticate' => 'root#authenticate'
  get 'logout' => 'root#logout'

  resources :items, only: [:index, :new, :create] do
    member do
      post :return
      post :notify
    end

    collection do
      get :archive
    end
  end
end
