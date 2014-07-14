class ProductsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, :with => :not_found
	def index
		@products = Product.all
	end
	def show
		@product = Product.find(params[:id])
	end

	private
	def not_found
		head 404
	end
end
