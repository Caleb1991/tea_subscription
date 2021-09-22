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

  def self.deleted_subscription
    {
      type: 'subscription',
      id: nil,
      message: 'Subscription has been successfully deleted.'
    }
  end

  def self.subscription_not_found
    {
      type: 'subscription',
      id: nil,
      message: 'Subscription not found'
    }
  end
end
