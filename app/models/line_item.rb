class LineItem < ActiveRecord::Base
  belongs_to :cart_a
  belongs_to :cart_b
  belongs_to :item
end
