class OrdersController < ApplicationController
	before_action :get_customer
	rescue_from ActiveRecord::RecordNotFound, :with => :not_found
	def index
		@orders = @customer.orders
	end

	def show
		@order = @customer.orders.where(id: params[:id]).first
		if(!@order)
			not_found
		end
	end

	private
	def get_customer
		@customer = Customer.find(params[:customer_id])
	end

	def not_found
		head 404
	end
end
