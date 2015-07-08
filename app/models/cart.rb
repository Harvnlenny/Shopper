class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items


  def update_total
    update total: line_items.sum(:subtotal)
  end

  def size
    line_items.sum(:quantity)
  end

  def description
    case size
    when 0
      'Empty Cart.'
    when 1
      items.first.name
    else
      items.first.name + ' and more.'
    end
  end
end
