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

	def create
		create_order_param = order_params
		create_order_param[:totalCost] = post_params[:totalCost]
		@order_create = Order.new(create_order_param)

		order_items = build_order_items
		@order_create.order_items << order_items
		@customer.orders << @order_create
		@order_create.save
		
		response.location = customer_order_url(@customer,@order_create)

		head 201
	end

	private
	def build_order_items
	    post_params[:order_items].map do |item_param|
			create_param = order_item_params
			create_param[:product_id] = item_param[:product_id]
			create_param[:amount] = item_param[:amount]

			OrderItem.new(create_param)
		end
	end

	def get_customer
		@customer = Customer.find(params[:customer_id])
	end

	def not_found
		head 404
	end

	def order_item_params
		params.permit(:product_id, :amount)
	end

	def order_params
		params.permit(:totalCost)
	end

	def post_params
		params.require(:order)
	end
end
