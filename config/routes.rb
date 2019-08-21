Rails.application.routes.draw do
  root "home#index"
  devise_for :admins, path: 'admin', controllers: { sessions: "admins/sessions" }
  devise_for :users, path: 'user', controllers: { sessions: "users/sessions" }
  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
