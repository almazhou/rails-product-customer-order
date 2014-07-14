object @customer

attributes :id, :name

node :uri do |customer|
 customer_url customer
end