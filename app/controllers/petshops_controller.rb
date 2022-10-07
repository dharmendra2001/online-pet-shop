class PetshopsController < ApplicationController
  def index
    @shop = Petshop.all
    @q = Pet.ransack(params[:q])
    @pet = @q.result(distinct: true)
  end

  def show
    @shop = Petshop.find(params[:id])
  end

  def new
    
  end

  def create
    unless current_user.petshop.blank?
      flash[:note] = "your are already created shop"
      redirect_to root_path
      return
    end
    @user = current_user.id
    @shop = Petshop.new(petshop_params)
    @shop.user = current_user
    if @shop.save 
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private 
  def petshop_params 
    params.permit(:shopname)
  end
end
