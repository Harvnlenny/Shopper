class ItemsController < ApplicationController
  #before_action :set_item, only: [:show, :create, :edit, :update, :destroy]

  def index
    quantity = params[:quantity]
    if params[:word]
      @items = Item.page(params[:page]).per(12).search(params[:word])
    else
      @items = Item.page(params[:page]).per(12).order(:name)
    end
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.create(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to lists_path, notice: 'Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def search
    @items = Item.search(params[:word])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:price_publix, :price_winn_dixie)
  end
end

