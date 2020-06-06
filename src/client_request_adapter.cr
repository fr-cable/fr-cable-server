class ClientRequestAdapter

  property app

  def initialize(@app : App)
    
  end

  def in_request(web_socket)

    socket = @app.list_sockets.connect(web_socket)
  
    web_socket.on_message do |message|
      mes = JSON.parse(message)
      mes_type = mes["type"]
      payload = mes["payload"]
      case mes_type
      when "connect"
        @app.client_in_request_processor.process_connect(socket.uuid, payload.to_s)
      when "subscribe"
        @app.client_in_request_processor.process_subscribe(payload["connection"].to_s, payload["room"].to_s)
      when "unsubscribe"
        @app.client_in_request_processor.process_unsubscribe(payload.to_s)
      when "message"
        @app.client_in_request_processor.process_message(payload["sub_uuid"].to_s, payload["message"].to_s)
      else
        puts "Undefined mestype: #{mes_type}"
        puts message.to_json
      end
    end
  
    web_socket.on_close do |_|
      @app.client_in_request_processor.process_disconnect(socket.uuid)
    end
  end

  def out_request(connection : StructConnection, payload)
    connection.socket.send(payload)
  end
end