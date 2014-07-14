require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
	render_views
	describe 'Test /GET' do
		before{
			@product_test = Product.create!(name:"test")

		}
		it "should return 200 for get all products" do
			get :index,format: :json
			expect(response.status).to be(200)
			productJsons = JSON.parse(response.body)

			expect(productJsons[0]["name"]).to eq("test")
		end

		it "should return 200 for get one products" do
			get :show, {id:1, format: :json}
			expect(response.status).to be(200)

			productJson = JSON.parse(response.body)

			expect(productJson["product"]["name"]).to eq("test")
		end

		it "should return 404 for get product which doesn't exist" do
			get :show, {id:10, format: :json}
			expect(response.status).to be(404)	
		end
	end

	describe "TEST /POST" do
		it "should return 201 for post one product" do
			post :create, product:{name:"testpost"}

			expect(response.status).to be(201)
			expect(response.location).to match("/products/")
		end
	end

end
