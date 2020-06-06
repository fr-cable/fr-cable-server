class ListServers

  property servers

  def initialize
    @servers = {} of String => StructServer
  end

  def get(uuid : String)
    @servers[uuid]
  end

  def connect(server : StructServer)
    @servers[server.uuid] = server
  end

  def disconnect(server : StructServer)
    @servers.delete(server.uuid)
  end

  def connect(connection : StructConnection)
    connection.server.connect(connection)
  end

  def disconnect(connection : StructConnection)
    connection.server.disconnect(connection)
  end

  def connect(room : StructRoom)
    room.server.connect(room)
  end

  def disconnect(room : StructRoom)
    room.server.disconnect(room)
  end

end