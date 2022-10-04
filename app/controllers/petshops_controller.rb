class PetshopsController < ApplicationController
  def index
    @shop = Petshop.all
  end

  def show
    @shop = Petshop.find(params[:id])
  end
end
