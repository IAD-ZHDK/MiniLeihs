Rails.application.routes.draw do
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
