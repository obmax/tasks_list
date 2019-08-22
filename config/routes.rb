Rails.application.routes.draw do
  root "home#index"
  devise_for :admins, path: 'admin', controllers: { sessions: "admins/sessions", registrations: 'admins/registrations' }
  devise_for :users, path: 'user', controllers: { sessions: "users/sessions", registrations: 'users/registrations' }
  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
