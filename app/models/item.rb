class Item < ActiveRecord::Base
  belongs_to :article, optional: true
  belongs_to :cart,  optional: true

  after_create :set_value

  def set_value
    amount = (self.article.price * self.quantity)
    update_column(:value, amount)
  end
end