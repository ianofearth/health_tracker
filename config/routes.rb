Rails.application.routes.draw do
  get '/' => 'users#index'

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  resources :users do
    resources :foods do
      collection { post :sort}
    end
  end

  resources :users do
    resources :exercises
  end

end
