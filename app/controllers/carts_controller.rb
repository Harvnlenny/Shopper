class CartsController < ApplicationController

  def index
    @carts = Cart.all
    # quantity = Hash.new(0)
    # total_price = 0
    # current_user.cart.each do |i|
    #   item = Item.find(i)
    #   puts item.name
    #   quantity[i] += 1
    #   total_price += item.price_publix
    # end
    # puts quantity
    # puts total_price
    # c = Cart.new
    # c.price_publix = total_price
    # c.quantity = quantity
    # c.name = "Cart"
    # c.save
    # @cart = Cart.find(c.id)
    # puts @cart
  end

  def show
    redirect_to(root_path) unless current_cart
    @cart = current_cart
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to @cart, notice: 'Cart was successfully created.'
    else
      render :new
    end
  end

  def update
    item = Item.find(params[:item_id])
    line = current_cart.line_items.find_or_create_by(:item => @item)

    if params[:quantity]
      if params[:quantity] == "0"
        line.destroy
        redirect_to cart_path, :notice => "#{item.name} removed from cart."
      else
        line.update(:quantity => params[:quantity])
        redirect_to cart_path, :notice => "#{item.name} quantity changed in cart."
      end
    else
      line.increment!(:quantity)
      redirect_to root_path, :notice => "Your item was added to cart."
    end
  end



  

  private

  def set_cart
    @cart = current_user.carts.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cart_params
    params.require(:cart).permit(:user_id, :total)
  end

  def current_cart
    @current_cart ||= (super || Cart.create!.tap { |c| session[:cart_id] = c.id })
  end
end
