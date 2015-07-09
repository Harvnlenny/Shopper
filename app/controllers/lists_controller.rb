class ListsController < ApplicationController
  def new
    @list = current_user.lists.new
  end
  
  def create
    @list = current_user.lists.new(list_params)

    respond_to do |format|
      if @list.save
        format.html {redirect_to lists_path, notice: 'List was successfully created.' }
      else
        format.html { render :new } 
      end
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def index
    @lists = current_user.try(:lists)
    if params[:search]
      @lists = List.search(params[:search])
    else
      @lists = List.all
    end
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html {redirect_to root_path, notice: 'List was successfully updated.' }
      else
         format.html {render :edit } 
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html {redirect_to lists_url, notice: 'List was successfully destroyed.' }
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
