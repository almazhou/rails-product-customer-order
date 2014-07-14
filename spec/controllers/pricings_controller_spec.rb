require 'rails_helper'

RSpec.describe PricingsController, :type => :controller do
	render_views
	describe "TEST /GET" do
		before{
			@product_test = Product.create!(name:"test")
			@pricing_test = Pricing.create!(amount:45.0,product_id: @product_test.id)
		}
		it "should return 200 for get all pricings" do
			get :index , product_id: 1, format: :json

			expect(response.status).to eq(200)

			pricingsJson = JSON.parse(response.body)
			expect(pricingsJson[0]["pricing"]["amount"]).to eq("45.0")
			expect(pricingsJson[0]["pricing"]["product_id"]).to be(1)
		end
	end
end
