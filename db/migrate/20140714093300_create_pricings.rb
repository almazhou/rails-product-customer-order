class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.references :product, index: true

      t.timestamps
    end
  end
end
