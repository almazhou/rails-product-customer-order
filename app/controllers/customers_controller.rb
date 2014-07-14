class CustomersController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, :with=> :not_found
	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def create
		customer = Customer.new(customer_params)
		customer.save
		response.location = customer_url customer
		head 201
	end

	private
	def customer_params
		params.require(:customer).permit(:name)
	end

	def not_found
		head 404
	end
end
