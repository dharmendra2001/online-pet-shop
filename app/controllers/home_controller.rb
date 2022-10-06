class HomeController < ApplicationController
  def index
    @users = User.all
    @shop = Petshop.all

  end

  def show 
    @users = User.find(params[:id])
  end

end
