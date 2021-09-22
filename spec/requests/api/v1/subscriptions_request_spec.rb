require 'rails_helper'

RSpec.describe 'Subscription API' do
  before :each do
    @customer_1 = Customer.create!(first_name: 'Roald', last_name: 'Roaldington', email: 'PenguinsRule@test.com', address: '1142 North Pole Ln.')
    @tea_1 = Tea.create!(title: 'Earl Grey', description: 'Tea, Earl Grey, Hot.', temperature: 190, brew_time: 30)
  end

  describe 'new' do
    it 'creates a new subscription' do
      subscription_payload = {
        title: 'Earl Greytness',
        price: 5.22,
        status: 0,
        frequency: 0,
        customer_id: @customer_1.id,
        tea_id: @tea_1.id
      }

      post '/api/v1/subscriptions', params: subscription_payload, as: :json

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:details][:title]).to eq(subscription_payload[:title])
    end
  end
end
