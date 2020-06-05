class ListRooms

  property rooms

  def initialize
    @rooms = {} of String => StructRoom
  end

  def get(room_full_name : String)
    @rooms[room_full_name]
  end

  def connect(room : StructRoom)
    @rooms[room.full_name] = room
  end

  def subscribe(subscription : StructSubscription)
    subscription.room.subscribe(subscription)
  end

  def unsubscribe(subscription)
    subscription.room.unsubscribe(subscription)
    if subscription.room.subscriptions.size == 0
      @rooms.delete(subscription.room.full_name)
    end
  end

end