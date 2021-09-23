Customer.destroy_all
Tea.destroy_all
Subscription.destroy_all

customer_1 = Customer.create!(first_name: 'Roald', last_name: 'Roaldington', email: 'PenguinsRule@test.com', address: '1142 North Pole Ln.')
tea_1 = Tea.create!(title: 'Earl Grey', description: 'Tea, Earl Grey, Hot.', temperature: 190, brew_time: 30)
subscription_1 = customer_1.subscriptions.create!(title: 'Earl Grey-tness', price: 5.11, frequency: 0, status: 0, tea_id: tea_1.id)
subscription_2 = customer_1.subscriptions.create!(title: 'Not Earl Grey-tness', price: 52.11, frequency: 1, status: 1, tea_id: tea_1.id)
