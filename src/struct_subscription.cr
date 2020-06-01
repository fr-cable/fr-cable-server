class StructSubscription
  property uuid, accepted, create_time, aborted, room, connection

  def initialize(@connection : StructConnection, @room : StructRoom)
    @uuid = Random::Secure.hex
    @accepted = false
    @create_time = Time.utc
    @aborted = false
  end
end