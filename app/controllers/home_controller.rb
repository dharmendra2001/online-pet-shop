class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i[payment]
  def index
    @users = User.all
    @shop = Petshop.all
    @q = Pet.ransack(params[:q])
    @pet = @q.result(distinct: true)

  end

  def show   
    @users = User.find(params[:id])
    raise CanCan::AccessDenied if User.where(id: @users.id).accessible_by(current_ability).empty?
  end

  def payment
  end

  def buy_pet 
  end

  def balance
    @users = User.find(params[:id])
    authorize! :read, @users 
  end
  
  def user_destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "user successfully deleted!" 
      redirect_to root_path
    else
      flash[:notice] = "something went wrong" 
      redirect_to user_destroy_path
    end
  end

  def charge
    pet_name = Pet.find_by(id: params[:pet_id]).petname
    check = true
    if check
      s = StripeService.new
      token = s.create_card_token(params)
      customer = s.find_or_create_customer(current_user)
      token= s.create_card_token(params)
      card=s.create_stripe_customer_card(token.id,customer)
      s.create_stripe_charge(params[:price], customer.id, card.id, pet_name)
      current_user.change_user_to_paid
      s.sell_pet(current_user.id, params[:pet_id], params[:price])
      flash[:notice] = "Your card has been paid!, transaction successful"
      redirect_to root_path(current_user.id)
    else
      redirect_to user_path(current_user.id), alert: "some error occured"
    end
  end

end
