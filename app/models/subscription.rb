class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :status, :frequency, required: true
  belongs_to :customer
  belongs_to :tea

  enum status: [:active, :paused, :cancelled]
  enum frequency: [:monthly, :every_three_months, :every_six_months, :annually]
end
