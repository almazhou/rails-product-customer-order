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
	end

end
