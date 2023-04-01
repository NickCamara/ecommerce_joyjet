class AddValueToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :value, :decimal, :precision => 12, :scale => 2
  end
end
