class DeliveryFee < ActiveRecord::Base
  has_one :eligible_transaction_volume,   dependent: :destroy, class_name: 'EligibleTransactionVolume'

  accepts_nested_attributes_for :eligible_transaction_volume
end