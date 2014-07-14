collection @orders, :object_root => false

attributes :id, :customer_id, :totalCost

node :uri do |order|
	customer_order_url(order.customer,order)
end

node :customer_uri do |order|
	customer_url order.customer
end

