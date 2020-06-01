class ListSubscriptions
  property subscriptions

  def initialize
    @subscriptions = {} of String => StructSubscription
  end
  
  def subscribe(subscription : StructSubscription)
    @subscriptions[subscription.uuid] = subscription
  end

  def get(subscription_uuid)
    @subscriptions[subscription_uuid]
  end

  def unsubscribe(subscription : StructSubscription)
    @subscriptions.delete(subscription.uuid)
  end

end