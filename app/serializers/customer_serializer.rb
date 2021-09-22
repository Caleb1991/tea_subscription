class CustomerSerializer
  def self.show_page(customer)
    {
      type: 'customer',
      id: customer.id,
        subscriptions:
        {
          subscription_details: customer.subscriptions
        }
    }
  end
end
