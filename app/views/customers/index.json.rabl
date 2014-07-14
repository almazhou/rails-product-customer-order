collection @customers,:object_root=>false

attributes :id, :name

node :uri do |customer|
 customer_url customer
end