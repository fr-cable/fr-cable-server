class ListSockets
  property sockets

  def initialize
    @sockets = {} of String => StructSocket
  end

  def get(uuid : String)
    @sockets[uuid]
  end

  def connect(web_socket : HTTP::WebSocket)
    socket = StructSocket.new(web_socket)
    @sockets[socket.uuid] = socket
  end

  def disconnect(uuid : String)
    socket = @sockets[uuid]
  end

  def connect(connection : StructConnection)
    connection.socket.connect(connection)
  end

  def disconnect(connection : StructConnection)
    connection.socket.disconnect(connection)
  end
end