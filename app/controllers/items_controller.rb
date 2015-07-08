class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

    respond_to do |format|
      if @item.save
        format.html {redirect_to root_path, notice: 'Item was successfully created.' }
      else
        format.html { render :new } 
      end
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(params[:item].permit(:description, :name, :category, :price_publix, :price_winn_dixie, :picture))
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

    def item_params
      params.require(:item).permit(:description, :name, :category, :price_publix, :price_winn_dixie, :picture)
    end
  end
