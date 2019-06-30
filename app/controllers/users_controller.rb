class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def myrecords
    @user = current_user
  end
  
end