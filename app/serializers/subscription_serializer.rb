class SubscriptionSerializer
  def self.subscription_details(subscription)
    {
      type: 'subscription',
      id: subscription.id,
      details: {
        title: subscription.title,
        price: subscription.price,
        status: subscription.status,
        frequency: subscription.frequency,
        customer_id: subscription.customer_id,
        tea_id: subscription.tea_id
      }
    }
  end

  def self.error_messages(failed_subscription)
    {
      type: 'subscription',
      id: nil,
      errors: {
        messages: failed_subscription.errors.full_messages
      }
    }
  end
end
