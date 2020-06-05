class StructServer
  property server_url, key, connections, rooms

  def initialize(@key : String, @server_url : String)
    @connections = {} of String => StructConnection
    @rooms = {} of String => StructRoom
  end

  def connect(connection : StructConnection)
    @connections[connection.uuid] = connection
  end

  def disconnect(connection : StructConnection)
    @connections.delete(connection)
  end

  def connect(room : StructRoom)
    @rooms[room.name] = room
  end

  def disconnect(room : StructRoom)
    @rooms.delete(room)
  end

end