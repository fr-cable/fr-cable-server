class ClientRequestAdapter

  property app, sockets

  def initialize(@app : App)
    @sockets = {} of String => HTTP::WebSocket
  end

  def in_request(socket)

    puts "Client connected"

    uuid = @app.client_in_request_processor.process_connect()
    sockets[uuid] = socket
  
    socket.on_message do |message|
      puts "Client send message: #{message}"
      mes = JSON.parse(message)
      mes_type = mes["type"]
      payload = mes["payload"]
      case mes_type
      when "subscribe"
        @app.client_in_request_processor.process_subscribe(uuid, payload["room"].to_s)
      when "unsubscribe"
        @app.client_in_request_processor.process_unsubscribe(payload.to_s)
      when "message"
        @app.client_in_request_processor.process_message(payload["sub_uuid"].to_s, payload["message"].to_s)
      else
        puts "Undefined mestype: #{mes_type}"
        puts message.to_json
      end
    end
  
    socket.on_close do |_|
      puts "Client disconnected: #{uuid}"
      @app.client_in_request_processor.process_disconnect(uuid)
      @sockets.delete(uuid)
    end
  end

  def out_request(uuid, payload)
    puts "To client: #{uuid} #{payload}"
    @sockets[uuid].send(payload)
  end
end