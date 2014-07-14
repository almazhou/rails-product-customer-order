class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :order, index: true

      t.timestamps
    end
  end
end
