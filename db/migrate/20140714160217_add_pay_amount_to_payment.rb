class AddPayAmountToPayment < ActiveRecord::Migration
  def change
  	add_column :payments, :pay_amount, :decimal
  end
end
