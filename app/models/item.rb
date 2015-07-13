class Item < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  
  def price(list)
    if list.name == "Publix"
      price_publix
    elsif list.name == "Winn Dixie"
      price_winn_dixie
    end
  end

  def lowest_price?(list)
    return true if price_publix <= price_winn_dixie && list.name == "Publix"
    return true if price_winn_dixie <= price_publix && list.name == "Winn Dixie"
  end

  def savings
    if list.name == price_winn_dixie
      savings = price_publix - price_winn_dixie
    else
      savings = price_winn_dixie - price_publix
    end
  end 
end
