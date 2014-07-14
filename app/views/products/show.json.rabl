object @product

attributes :id, :name

node(:uri) { |product| product_url product}