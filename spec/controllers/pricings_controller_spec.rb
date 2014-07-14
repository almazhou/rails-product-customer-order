require 'rails_helper'

RSpec.describe PricingsController, :type => :controller do
	render_views
	describe "TEST /GET" do
		before{
			@product_test = Product.create!(name:"test")
			@pricing_test = Pricing.create!(amount:45.0,product_id: @product_test.id)
			@pricing_test2 = Pricing.create!(amount:49.0,product_id: @product_test.id)
		}
		it "should return 200 for get all pricings" do
			get :index , product_id: 1, format: :json

			expect(response.status).to eq(200)

			pricingsJson = JSON.parse(response.body)
			expect(pricingsJson[0]["amount"]).to eq("45.0")
			expect(pricingsJson[0]["product_id"]).to be(1)
		end

		it "should return 200 for get one pricings" do
			get :show , product_id: 1, id: 1, format: :json

			expect(response.status).to eq(200)

			pricingsJson = JSON.parse(response.body)
			expect(pricingsJson["pricing"]["amount"]).to eq("45.0")
			expect(pricingsJson["pricing"]["product_id"]).to be(1)
		end

		it "should return 404 for get one pricing not failed" do
			get :show , product_id: 1, id: 15, format: :json

			expect(response.status).to eq(404)
		end
	end
end
