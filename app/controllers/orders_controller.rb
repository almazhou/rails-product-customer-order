class OrdersController < ApplicationController
	before_action :get_customer
	def index
		@orders = @customer.orders
	end

	private
	def get_customer
		@customer = Customer.find(params[:customer_id])
	end
end
