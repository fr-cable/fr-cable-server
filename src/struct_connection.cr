class StructConnection
  property uuid, accepted, create_time, aborted, subscriptions, server, socket

  def initialize(@socket : StructSocket, @server : StructServer)
    @uuid = Random::Secure.hex
    @accepted = false
    @create_time = Time.utc
    @aborted = false
    @subscriptions = {} of String => StructSubscription
  end

  def unsubscribe(subscription : StructSubscription)
    @subscriptions.delete(subscription.uuid)
  end

  def subscribe(subscription : StructSubscription)
    @subscriptions[subscription.uuid] = subscription
  end
end