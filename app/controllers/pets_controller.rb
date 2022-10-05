class PetsController < ApplicationController
  def index
    @pet = Pet.all
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

  private 
  def pet_params 
    params.permit(:petname, :food, :weight, :height, :age, :description, :precaution, :medical, :image)
  end
end
