Rails.application.routes.draw do
  root 'home#index'
  resources :users

  #LOGIN: create a session (new_session_path)
  #LOGOUT: delete a session (destroy_session_path)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
