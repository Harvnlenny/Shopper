class ListItem < ActiveRecord::Base
  belongs_to :list
  belongs_to :item
  belongs_to :user

  delegate :name, to: :item
  delegate :price, to: :item

  before_save :update_subtotal

  def update_subtotal
    self.subtotal = quantity * price(list)
  end

end
