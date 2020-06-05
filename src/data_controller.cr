class DataController

  property app

  def initialize(@app : App)

  end

  def subscribe(subscription : StructSubscription)
    @app.list_subscriptions.subscribe(subscription)
    @app.list_connections.subscribe(subscription)
    @app.list_rooms.subscribe(subscription)
  end

  def unsubscribe(subscription : StructSubscription)
    @app.list_subscriptions.unsubscribe(subscription)
    @app.list_connections.unsubscribe(subscription)
    @app.list_rooms.unsubscribe(subscription)
  end

  def connect(server : StructServer)
    @app.list_servers.connect(server)
  end

  def connect(room : StructRoom)
    @app.list_servers.connect(room)
    @app.list_rooms.connect(room)
  end

  def disconnect(room : StructRoom)
    @app.list_servers.disconnect(room)
    @app.list_rooms.disconnect(room)
  end

  def connect(connection : StructConnection)
    @app.list_connections.connect(connection)
    @app.list_servers.connect(connection)
    @app.list_sockets.connect(connection)
  end

  def disconnect(connection : StructConnection)
    @app.list_servers.disconnect(connection)
    @app.list_sockets.disconnect(connection)
    @app.list_connections.disconnect(connection)
  end

  def deny_connection(connection : StructConnection)
    connection.aborted = true
  end

  def accept_connection(connection : StructConnection)
    connection.accepted = true
  end

  def deny_subscription(subscription : StructSubscription)
    subscription.aborted = true
  end

  def accept_subscription(subscription : StructSubscription)
    subscription.accepted = true
  end
end