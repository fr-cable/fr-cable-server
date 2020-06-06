class ServerInRequestProcessor #SIRP

  property app

  def initialize(@app : App)

  end

  def process_message(room_name : String, payload : String)
    room = @app.list_rooms.get(room_name)
    if !room.nil?
      room.subscriptions.each do |key, subscription|
        if subscription.accepted
          @app.client_out_request_processor.process_message(subscription, payload)
        end
      end
    end
  end

  def process_add_server(url : String)
    server = StructServer.new(url)
    @app.data_controller.connect(server)
    @app.server_out_request_processor.process_server_added(server)
  end

  def process_accept_connection(connection_uuid : String)
    connection = @app.list_connections.get(connection_uuid)
    @app.data_controller.accept_connection(connection)
    @app.client_out_request_processor.process_accept_connection(connection)
  end

  def process_deny_connection(connection_uuid : String)
    connection = @app.list_connections.get(connection_uuid)
    @app.data_controller.deny_connection(connection)
    @app.client_out_request_processor.process_deny_connection(connection)
  end

  def process_accept_subscription(subscription_uuid : String)
    subscription = @app.list_subscriptions.get(subscription_uuid)
    @app.data_controller.accept_subscription(subscription)
    @app.client_out_request_processor.process_accept_subscription(subscription)
  end

  def process_deny_subscription(subscription_uuid : String)
    subscription = @app.list_subscriptions.get(subscription_uuid)
    @app.data_controller.deny_subscription(subscription)
    @app.client_out_request_processor.process_deny_subscription(subscription)
  end

end