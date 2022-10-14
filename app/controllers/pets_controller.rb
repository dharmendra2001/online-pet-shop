class PetsController < ApplicationController
  load_and_authorize_resource only: %i[new]
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
    if @pet.save
      flash[:notice] = "pet added successfully in your shop!"
    else
      flash[:notice] = @pet.errors.full_messages.join(" , ")
    end
    redirect_to root_path
  end

  def medical_certificate 
    @pet = Pet.find(params[:id])
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    flash[:notice] = "pet deleted successfully!"
    redirect_to root_path
  end

  private 
  def pet_params 
    params.permit(:petname, :pet_type, :food, :weight, :height, :age, :description, :precaution, :medical, :price, :image)
  end
end
