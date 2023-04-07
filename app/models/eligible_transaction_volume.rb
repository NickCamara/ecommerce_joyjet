class EligibleTransactionVolume < ActiveRecord::Base
  belongs_to :delivery_fee, optional: true    
end