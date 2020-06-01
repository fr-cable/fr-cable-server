class ClientInRequestProcessor #CIRP

  property app

  def initialize(@app : App)

  end

  def process_subscribe(connection_uuid : String, room_name : String)
    connection = @app.list_connections.get(connection_uuid)
    room = @app.list_rooms.get_or_create(room_name)
    subscription = StructSubscription.new(connection, room)
    @app.data_controller.subscribe(subscription)
    @app.server_out_request_processor.process_subscribe(subscription)
  end

  def process_unsubscribe(subscription_uuid : String)
    subscription = @app.list_subscriptions.get(subscription_uuid)
    @app.data_controller.unsubscribe(subscription)
    @app.server_out_request_processor.process_unsubscribe(subscription)
  end

  def process_message(subscription_uuid : String, message : String)
    subscription = @app.list_subscriptions.get(subscription_uuid)
    @app.server_out_request_processor.process_message(subscription, message)
  end

  def process_connect
    connection = StructConnection.new
    @app.data_controller.connect(connection)
    @app.server_out_request_processor.process_connect(connection)
    return connection.uuid
  end

  def process_disconnect(connection_uuid)
    connection = @app.list_connections.get(connection_uuid)
    @app.data_controller.disconnect(connection)
    @app.server_out_request_processor.process_disconnect(connection)
  end
end