class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  # def new
  #   @item = current_user.items.new
  # end

  # def create
  #   @item = current_user.items.create(item_params)

  #   respond_to do |format|
  #     if @item.save
  #       format.html {redirect_to lists_path, notice: 'Item was successfully created.' }
  #     else
  #       format.html { render :new } 
  #     end
  #   end
  # end

  def edit
  end

  # def destroy
  #   @item.destroy
  #   respond_to do |format|
  #     format.html {redirect_to items_url, notice: 'Item was successfully destroyed.' }
  #   end
  # end

  def index
    @items = Item.order(:name)
    quantity = params[:quantity]
  end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_item
    @item = current_user.items.find(params[:id])      
  end    

  def item_params
    params.require(:item).permit(:price_publix, :price_winn_dixie)
  end
end

