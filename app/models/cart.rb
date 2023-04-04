class Cart < ActiveRecord::Base
  has_many :items,             dependent: :destroy, class_name: 'Item'

  after_create :set_total
  
  accepts_nested_attributes_for :items

  def set_total
    if self.items.size > 0
      price = self.items.sum(&:value)
      update_column(:total, value)
    end
  end
end