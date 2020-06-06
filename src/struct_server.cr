class StructServer
  property server_url, uuid, connections, rooms

  def initialize(@server_url : String)
    @uuid = Random::Secure.hex
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