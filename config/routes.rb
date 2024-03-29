TraqTastic::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
    get '/users/connect/:network',
      :to => redirect("/users/auth/facebook"),
      :as => 'user_oauth_connect'
  end
  resources :timers
  resources :reports

  root :to => "welcome#index"
end
