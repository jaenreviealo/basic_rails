Rails.application.routes.draw do
  root to: "dashboard#index"

  devise_for(
    :users, 
    class_name: "User", 
    path: '', 
    path_names: { 
      sign_in: 'login', 
      sign_up: 'signup', 
      sign_out: 'logout'
    },
    controllers: {
      sessions: "sessions",
      registrations: "registrations"
    }
  )

  resources :puroks
  resources :residents
end
