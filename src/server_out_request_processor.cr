class ServerOutRequestProcessor #SORP

  property app

  def initialize(@app : App)

  end

  def process_subscribe(subscription : StructSubscription)
    spawn do
      @app.server_request_adapter.out_request({type: "subscribe", payload: {room: subscription.room.name, connection: subscription.connection.uuid, subscription: subscription.uuid} }.to_json)
    end
  end

  def process_unsubscribe(subscription : StructSubscription)
    spawn do
      @app.server_request_adapter.out_request({type: "unsubscribe", payload: subscription.uuid}.to_json)
    end
  end

  def process_message(subscription : StructSubscription, message : String)
    spawn do
      @app.server_request_adapter.out_request({type: "message", payload: {connection_uuid: subscription.connection.uuid, room: subscription.room.name, message: message}}.to_json)
    end
  end

  def process_connect(connection : StructConnection)
    spawn do
      @app.server_request_adapter.out_request({type: "connect", payload: connection.uuid }.to_json)
    end
  end

  def process_disconnect(connection : StructConnection)
    spawn do
      @app.server_request_adapter.out_request({type: "disconnect", payload: connection.uuid }.to_json)
    end
  end

end