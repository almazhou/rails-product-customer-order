require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
	render_views
	describe "test /GET" do
		before{
			@customer = Customer.create!(name: "test_name")
			@product = Product.new(name:"product1")
			@order = Order.create!({totalCost: 45.0,customer_id:1})
			@order2 = Order.create!({totalCost: 80.0,customer_id:1})
			@order_item = OrderItem.new(order_id: 1, product_id: 1)
			}
		it "should return 200 for get all orders" do
			get :index, customer_id: 1, format: :json

			expect(response.status).to be(200)

			ordersJson = JSON.parse(response.body)

			expect(ordersJson[0]["totalCost"]).to eq("45.0")
			expect(ordersJson[0]["customer_id"]).to be(1)
		end

		it "should return 200 for get one order" do
			get :show, customer_id: 1, id: 1, format: :json
			
			expect(response.status).to be(200)

			ordersJson = JSON.parse(response.body)
			puts "%"*50
			puts ordersJson.inspect
			puts "*"*50

			expect(ordersJson["order"]["totalCost"]).to eq("45.0")
			expect(ordersJson["order"]["customer_id"]).to be(1)

		end

		it "should return 200 for get one order" do
			get :show, customer_id: 1, id: 100, format: :json
			
			expect(response.status).to be(404)
		end

	end

end
