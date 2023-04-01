class CreateItem < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :article_id
      t.integer :quantity
      t.integer :cart_id
      t.timestamps
    end
  end
end
