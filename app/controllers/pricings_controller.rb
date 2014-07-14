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

	private
	def get_product
		@product = Product.find(params[:product_id])
	end
	def not_found
		head 404
	end
end
