class AddTotalCostToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :totalCost, :decimal
  end
end
