class Cart < ActiveRecord::Base
  has_many :items,             dependent: :destroy, class_name: 'Item'

  after_create :set_total
  
  accepts_nested_attributes_for :items

  def set_total
    if self.items.size > 0
      amount = self.items.sum(&:value)
      if amount > 0 
        price = EligibleTransactionVolume.where("min_price <= ? and max_price >= ?", amount, amount).last.delivery_fee.try(:price)
        amount = amount + price
      end
      update_column(:total, amount)
    end
  end
end