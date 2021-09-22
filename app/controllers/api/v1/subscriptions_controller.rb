class Api::V1::SubscriptionsController < ApplicationController
  def create
    new_sub = Subscription.create(subscription_payload)

    if new_sub.save
      render json: SubscriptionSerializer.subscription_details(new_sub)
    else
      render json: SubscriptionSerializer.error_messages(new_sub), status: 400
    end
  end

  private
  def subscription_payload
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
