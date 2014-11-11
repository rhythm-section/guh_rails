GuhRails::Application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :devices do
        post 'discover', on: :collection
        post 'confirm_pairing', on: :collection

        resources :actions do
          post 'execute', on: :member
        end
      end

      resources :device_classes
      resource  :introspect
      resources :rules

      resources :vendors do
        resources :device_classes
      end

    end
  end

  get 'introspect' => 'dummy#introspect'

  root to: 'dummy#index'

end
