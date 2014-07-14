class PaymentsController < ApplicationController
	before_action :get_order
	rescue_from ActiveRecord::RecordNotFound, :with => :not_found
	def index
		@payment = @order.payment
	end
	private
	def get_order
		@customer = Customer.find(params[:customer_id])
		@order = @customer.orders.where(id: params[:order_id]).first
		if(!@order)
			not_found
		end
	end
	def not_found
		head 404
	end
end
