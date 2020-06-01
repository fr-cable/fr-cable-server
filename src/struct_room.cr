class StructRoom
  property uuid, name, create_time, subscriptions

  def initialize(@name : String)
    @uuid = Random::Secure.hex
    @create_time = Time.utc
    @subscriptions = {} of String => StructSubscription
  end

  def unsubscribe(subscription : StructSubscription)
    @subscriptions.delete(subscription.uuid)
  end

  def subscribe(subscription : StructSubscription)
    @subscriptions[subscription.uuid] = subscription
  end
end