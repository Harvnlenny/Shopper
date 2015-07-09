class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, :except => [:index]

  def index
    current_user = User.find_by_id(session[:user_id])
  end

  def show
    @user = User.find(params[:id])
  end

end
