GuhRails::Application.routes.draw do

  namespace :api do
    namespace :v1 do

      # POST Devices.AddConfiguredDevice
      # GET Devices.GetConfiguredDevices
      # DELETE Devices.RemoveConfiguredDevice
      resources :devices do

        # Devices.GetDiscoveredDevices
        get 'discover', on: :collection

        # TODO Devices.PairDevice

        # Devices.ConfirmPairing
        post 'confirm_pairing', on: :collection

        # Devices.GetActionTypes
        resources :actions do
          # POST Actions.ExecuteAction
          post 'execute', on: :member
        end

        # GET Devices.GetStateValue
        resources :states
      end

      # GET Devices.GetSupportedDevices
      resources :device_classes do
        # GET Devices.GetStateTypes
        resources :state_types
      end

      # TODO Devices.GetEventTypes

      # TODO Devices.GetPluginConfiguration
      # TODO Devices.GetPlugins
      # TODO Devices.SetPluginConfiguration

      # GET JSONRPC.Introspect
      resource  :introspect

      # GET Rules.GetRules
      # GET Rules.GetRuleDetails
      # POST Rules.AddRule
      # DELETE Rules.RemoveRule
      # TODO Rules.FindRules
      resources :rules

      # GET Devices.GetSupportedVendors
      resources :vendors do
        resources :device_classes
      end

      # TODO JSONRPC.Version
    end
  end

  get 'introspect' => 'dummy#introspect'

  # JSONRPC.SetNotificationStatus => via websocket

  get 'websocket' => 'dummy#websocket'
  root to: 'dummy#index'

end
