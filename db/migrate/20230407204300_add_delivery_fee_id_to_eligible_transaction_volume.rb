class AddDeliveryFeeIdToEligibleTransactionVolume < ActiveRecord::Migration[5.2]
  def change
    add_column :eligible_transaction_volumes, :delivery_fee_id, :integer
  end
end
