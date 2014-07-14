class ProductsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, :with => :not_found
	def index
		@products = Product.all
	end
	def show
		@product = Product.find(params[:id])
	end

	def create
		product = Product.new(product_params)
		product.save
		response.location = product_url product
		head 201
	end

	private
	def not_found
		head 404
	end
	def product_params
		params.require(:product).permit(:name)
	end
end
