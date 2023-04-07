class CreateEligibleTransactionVolume < ActiveRecord::Migration[5.2]
  def change
    create_table :eligible_transaction_volumes do |t|
      t.decimal :min_price, :precision => 12, :scale => 2
      t.decimal :max_price, :precision => 12, :scale => 2
    end
  end
end
