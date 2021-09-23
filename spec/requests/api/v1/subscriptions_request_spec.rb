require 'rails_helper'

RSpec.describe 'Subscription API' do
  before :each do
    @customer_1 = Customer.create!(first_name: 'Roald', last_name: 'Roaldington', email: 'PenguinsRule@test.com', address: '1142 North Pole Ln.')
    @tea_1 = Tea.create!(title: 'Earl Grey', description: 'Tea, Earl Grey, Hot.', temperature: 190, brew_time: 30)
  end

  describe 'create' do
    it 'creates a new subscription' do
      subscription_payload = {
        title: 'Earl Greytness',
        price: 5.11,
        status: 0,
        frequency: 0,
        customer_id: @customer_1.id,
        tea_id: @tea_1.id
      }

      post '/api/v1/subscriptions', params: subscription_payload, as: :json

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:details][:title]).to eq(subscription_payload[:title])
    end

    it 'sends back error messages' do
      subscription_payload = {
        title: 'Earl Greytness',
        frequency: 0,
        customer_id: @customer_1.id,
        tea_id: @tea_1.id
      }

      post '/api/v1/subscriptions', params: subscription_payload, as: :json

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:errors][:messages]).to eq(["Price can't be blank", "Status can't be blank"])
    end
  end

  describe 'destroy' do
    it 'deletes a given subscription' do
      sub_1 = @customer_1.subscriptions.create(title: 'Earl Greytness', price: 5.33, status: 0, frequency: 0, tea_id: @tea_1.id)

      delete "/api/v1/subscriptions/#{sub_1.id}"

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:message]).to eq('Subscription has been successfully deleted.')
    end
  end

  describe 'update' do
    it 'updates a given subscription' do
      sub_1 = @customer_1.subscriptions.create(title: 'Earl Greytness', price: 5.33, status: 0, frequency: 0, tea_id: @tea_1.id)

      updates = {status: 2}

      patch "/api/v1/subscriptions/#{sub_1.id}", params: updates, as: :json

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:details][:status]).to eq('cancelled')
    end
  end
end
