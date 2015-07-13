class ListItem < ActiveRecord::Base
  belongs_to :list
  belongs_to :item
  belongs_to :user

  delegate :name, to: :item
  delegate :price, to: :item


  before_save :update_subtotal
  before_save :update_savings


  def update_subtotal
    self.subtotal = quantity * price(list)
  end
  
  def update_savings
    self.savings = quantity * item.savings(list)
  end

end
