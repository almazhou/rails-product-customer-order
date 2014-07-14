object @pricing
attributes :id, :amount, :product_id

node :uri do |pricing|
    product_pricing_url :product_id => pricing.product_id,
    :id => pricing.id
end