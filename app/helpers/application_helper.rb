module ApplicationHelper
  def format_money(cents)
    number_to_currency((cents || 0) / 100.0)
  end

  def button_class_for_item(list, item)
    item.lowest_price?(list) ? 'lowest' : 'not-lowest'
  end

  def row_class_for_item(item)
    current_user.items.include?(item) ? 'added' : 'not-added'
  end

    def flash_messages
    flash.map do |key, msg|
      content_tag :div, msg, :class => key
    end.join.html_safe
  end
end
