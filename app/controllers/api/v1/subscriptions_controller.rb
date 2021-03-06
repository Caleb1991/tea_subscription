class Api::V1::SubscriptionsController < ApplicationController
  def create
    new_sub = Subscription.create(subscription_payload)

    if new_sub.save
      render json: SubscriptionSerializer.subscription_details(new_sub)
    else
      render json: SubscriptionSerializer.error_messages(new_sub), status: 400
    end
  end

  def update
    subscription = Subscription.find(params[:id])

    updated_sub = subscription.update(subscription_payload)

    render json: SubscriptionSerializer.subscription_details(subscription)
  end

  def destroy
    sub = Subscription.find(params[:id])

    sub.delete

    render json: SubscriptionSerializer.deleted_subscription
  end

  private
  def subscription_payload
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
