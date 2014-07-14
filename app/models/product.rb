class Product < ActiveRecord::Base
	has_many :pricings
	has_many :order_items
end
