class ListRooms

  property rooms

  def initialize
    @rooms = {} of String => StructRoom
  end

  def get(room_name : String)
    @rooms[room_name]
  end

  def get_or_create(room_name : String)
    if @rooms.has_key?(room_name)
      @rooms[room_name]
    else
      room = StructRoom.new(room_name)
      @rooms[room_name] = room
    end
  end

  def subscribe(subscription : StructSubscription)
    subscription.room.subscribe(subscription)
  end

  def unsubscribe(subscription)
    subscription.room.unsubscribe(subscription)
    if subscription.room.subscriptions.size == 0
      @rooms.delete(subscription.room.name)
    end
  end

end