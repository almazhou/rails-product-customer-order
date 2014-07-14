object @payment

attributes :id, :pay_amount, :order_id

node :uri do |payment|
	customer_order_payment_url(payment.order.customer,payment.order,payment)
end