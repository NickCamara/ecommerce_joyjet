class CreateArticle < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :name
      t.decimal :price, :precision => 12, :scale => 2
      t.timestamps
    end
  end
end
