Rails.application.routes.draw do
  root "home#index"
  devise_for :admins, path: 'admin', controllers: { sessions: "admins/sessions", registrations: 'admins/registrations' }
  devise_for :users, path: 'user', controllers: { sessions: "users/sessions", registrations: 'users/registrations' }
  resources :tasks do
    member do
      get :start_working
      get :back_to_do
      get :send_to_review
      get :close
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
