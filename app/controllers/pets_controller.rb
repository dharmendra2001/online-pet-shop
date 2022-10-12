class PetsController < ApplicationController
  
  def index

  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.petshop = current_user.petshop
    @pet.save
    redirect_to root_path
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to root_path
  end

  private 
  def pet_params 
    params.permit(:petname, :pet_type, :food, :weight, :height, :age, :description, :precaution, :medical, :price, :image)
  end
end
