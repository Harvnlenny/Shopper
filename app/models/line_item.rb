class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item, :required => true

  #before_save :update_subtotal
  after_save :update_cart_total
  after_destroy :update_cart_total

  def update_subtotal
    #self.subtotal = item.price_publix * quantity
  end

  def update_cart_total
    cart.update_total
  end
end
