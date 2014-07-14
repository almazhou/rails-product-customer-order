require 'rails_helper'

RSpec.describe CustomersController, :type => :controller do
	render_views
	describe "test /GET" do
		before{
			@customer = Customer.create!(name: 'test')
		}
		it "should return 200 for get all customers" do
			get :index,format: :json

			expect(response.status).to be(200)

			customersJson = JSON.parse(response.body)

			expect(customersJson[0]["name"]).to eq("test")
		end

		it "should return 200 for get one customers" do
			get :show,id: 1, format: :json

			expect(response.status).to be(200)

			customersJson = JSON.parse(response.body)

			expect(customersJson["customer"]["name"]).to eq("test")
		end

		it "should return 200 for get one customers" do
			get :show,id: 100, format: :json

			expect(response.status).to be(404)
		end
	end

	describe "test /POST" do
		it "should return 201 for post one customer" do
			post :create, customer:{name: "test_customer"}

			expect(response.status).to be(201)
			expect(response.location).to match("/customers/")
		end
	end

end
