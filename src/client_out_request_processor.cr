class ClientOutRequestProcessor #CORP

  property app

  def initialize(@app : App)

  end

  def process_deny_subscription(subscription : StructSubscription)
    spawn do
      @app.client_request_adapter.out_request(subscription.connection.uuid, {type: "deny_subscription", payload: {room: subscription.room.name, connection: subscription.connection.uuid}}.to_json)
    end
  end

  def process_accept_subscription(subscription : StructSubscription)
    spawn do
      @app.client_request_adapter.out_request(subscription.connection.uuid, {type: "accept_subscription", payload: {subscription: subscription.uuid, room: subscription.room.name, connection: subscription.connection.uuid}}.to_json)
    end
  end

  def process_accept_connection(connection : StructConnection)
    spawn do
      @app.client_request_adapter.out_request(connection.uuid, {type: "accept_connection", payload: connection.uuid}.to_json)
    end
  end

  def process_deny_connection(connection : StructConnection)
    spawn do
      @app.client_request_adapter.out_request(connection.uuid, {type: "deny_connection"}.to_json)
    end
  end

  def process_message(subscription : StructSubscription, payload : String)
    spawn do
      @app.client_request_adapter.out_request(subscription.connection.uuid, {type: "message", payload: {subscription: subscription.uuid, message: payload}}.to_json)
    end
  end
end