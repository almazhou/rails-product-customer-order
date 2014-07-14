class PricingsController < ApplicationController
	before_action :get_product,only:[:index,:show,:create]

	def index
		@pricings = @product.pricings
	end

	private
	def get_product
		@product = Product.find(params[:product_id])
	end
end
