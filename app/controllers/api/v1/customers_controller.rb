class Api::V1::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    render json: CustomerSerializer.show_page(@customer)
  end

end
