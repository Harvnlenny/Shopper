class List < ActiveRecord::Base
  include ApplicationHelper
  has_many :list_items
end

