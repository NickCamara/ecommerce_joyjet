class CreateCart < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.decimal :total, :precision => 12, :scale => 2
      t.timestamps
    end
  end
end
