class PricingsController < ApplicationController
	before_action :get_product,only:[:index,:show,:create]
	rescue_from ActiveRecord::RecordNotFound, :with => :not_found

	def index
		@pricings = @product.pricings
	end
	def show
		@pricing = @product.pricings.where(id: params[:id]).first
		if(!@pricing)
			not_found
		end
	end

	def create
		@pricing = @product.pricings.build(pricing_params)
		@pricing.save
		response.location = product_pricing_url(@product,@pricing)
		head 201
	end

	private
	def get_product
		@product = Product.find(params[:product_id])
	end
	def not_found
		head 404
	end
	def pricing_params
		params.require(:pricing).permit(:amount)
	end
end
