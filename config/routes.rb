HiveRails::Application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      
      resources :devices
      resources :rules
      
    end
  end
  
end
