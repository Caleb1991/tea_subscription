require 'rails_helper'

RSpec.describe 'Customers API' do
  before :each do
    @customer_1 = Customer.create!(first_name: 'Roald', last_name: 'Roaldington', email: 'PenguinsRule@test.com', address: '1142 North Pole Ln.')
    @tea_1 = Tea.create!(title: 'Earl Grey', description: 'Tea, Earl Grey, Hot.', temperature: 190, brew_time: 30)
    @subscription_1 = @customer_1.subscriptions.create!(title: 'Earl Grey-tness', price: 5.11, frequency: 0, status: 0, tea_id: @tea_1.id)
    @subscription_2 = @customer_1.subscriptions.create!(title: 'Not Earl Grey-tness', price: 52.11, frequency: 1, status: 1, tea_id: @tea_1.id)
  end

  describe '#show' do
    it 'sends all subscriptions for a given cutomer' do

      get "/api/v1/customers/#{@customer_1.id}"

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:subscriptions][:subscription_details][0][:title]).to eq(@subscription_1.title)
      expect(response_body[:subscriptions][:subscription_details][0][:price]).to eq(@subscription_1.price)
      expect(response_body[:subscriptions][:subscription_details][0][:status]).to eq('active')
      expect(response_body[:subscriptions][:subscription_details][0][:frequency]).to eq('monthly')
    end
  end
end
