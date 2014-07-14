class AddAmountColumnToPricing < ActiveRecord::Migration
  def change
  	add_column :pricings,:amount,:decimal
  end
end
