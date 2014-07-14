require 'rails_helper'

RSpec.describe PaymentsController, :type => :controller do
	render_views
	describe "test /GET" do
		before{
			@customer = Customer.create!(name: "test_name")
			@order = Order.create!({totalCost: 45.0,customer_id:1})
			@payment = Payment.create!({pay_amount: 45.0,order_id: 1})
		}
		it "should return 200 for get payments of one order" do
			get :index, customer_id: 1, order_id: 1, format: :json

			expect(response.status).to be(200)

			paymentJson = JSON.parse(response.body)

			expect(paymentJson["payment"]["pay_amount"]).to eq("45.0")
			expect(paymentJson["payment"]["order_id"]).to be(1)
		end
	end
end
