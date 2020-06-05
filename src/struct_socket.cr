class StructSocket
  property uuid, socket, connections

  def initialize(@socket : HTTP::WebSocket)
    @uuid = Random::Secure.hex
    @connections = {} of String => StructConnection
  end

  def send(payload)
    socket.send(payload)
  end

  def connect(connection : StructConnection)
    @connections[connection.uuid] = connection
  end

  def disconnect(connection : StructConnection)
    @connections.delete(connection)
  end

end