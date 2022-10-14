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
      flash[:notice] = "Shop created successfully" 
      redirect_to root_path
    else
      flash[:notice] = @shop.errors.full_messages.join(" , ")
      redirect_to new_petshop_path
    end
  end

  def destroy_method
    @shop = Petshop.find(params[:id])
    if @shop.destroy
      flash[:notice] = "shop successfully deleted!" 
      redirect_to root_path
    else
      flash[:notice] = "something went wrong" 
      redirect_to new_petshop_path
    end
  end

  private 
  def petshop_params 
    params.permit(:shopname)
  end
end