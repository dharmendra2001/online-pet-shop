class HomeController < ApplicationController
  def index
    @users = User.all
    @shop = Petshop.all
    @q = Pet.ransack(params[:q])
    @pet = @q.result(distinct: true)

  end

  def show 
    @users = User.find(params[:id])
  end

end
