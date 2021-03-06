class ListsController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @lists = List.all  
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to lists_path, notice: 'List was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to root_path, notice: 'List was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
    end
  end

  def show
    @list = List.find(params[:id])
    
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = current_user.lists.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def list_params
    params.require(:list).permit(:name)
  end
end
