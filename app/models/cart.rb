class Cart < ActiveRecord::Base
  has_many :items

  after_create :set_total
  
  def set_total
    if self.items.size > 0
      price = self.items.sum(&:value)
      update_column(:total, value)
    end
  end
end