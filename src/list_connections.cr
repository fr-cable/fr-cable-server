class ListConnections

  property connections

  def initialize
    @connections = {} of String => StructConnection
  end

  def connect(connection : StructConnection)
    @connections[connection.uuid] = connection
  end

  def disconnect(connection : StructConnection)
    @connections.delete(connection.uuid)
  end

  def subscribe(subscription : StructSubscription)
    subscription.connection.subscribe(subscription)
  end

  def unsubscribe(subscription : StructSubscription)
    subscription.connection.unsubscribe(subscription)
  end

  def get(connection_uuid : String)
    @connections[connection_uuid]
  end
end