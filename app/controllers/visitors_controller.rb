class VisitorsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(12)
  end
end
