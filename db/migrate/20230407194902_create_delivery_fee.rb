class CreateDeliveryFee < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_fees do |t|
      t.decimal :price, :precision => 12, :scale => 2
    end
  end
end
