module WebsocketModule
  # TODO create a channel manager
  websocket_connections = []

  EM.next_tick do
    Guh::EM::Notifications.subscribe do |guh_connection|
      guh_connection.onmessage do |message|
        begin
          websocket_connections.each { |client| client.send(JSON.dump(message)) }
        rescue Exception => e
          puts "--> oh no! #{e}"
        end
      end
    end

    EM::WebSocket.run host: '0.0.0.0', port: (ENV['WEBSOCKET_PORT'] || 3001) do |websocket|
      websocket.onopen do |handshake|
        puts "New websocket client connected"

        websocket_connections << websocket
      end

      websocket.onclose do
        puts "Websocket client disconnected"

        websocket_connections.delete(websocket)
      end
    end
  end
end
