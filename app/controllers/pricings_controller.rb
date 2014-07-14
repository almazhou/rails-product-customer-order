class PricingsController < ApplicationController
	before_action :get_product,only:[:index,:show,:create]

	def index
		@pricings = @product.pricings
	end
	def show
		@pricing = @product.pricings.where(id: params[:id]).first
		puts "*"*50
		puts @pricing.inspect
		puts "&"*50
	end

	private
	def get_product
		@product = Product.find(params[:product_id])
	end
end
