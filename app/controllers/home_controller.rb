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

  def payment
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
      s.create_stripe_charge(params[:amount_to_be_paid], customer.id, card.id, pet_name)
      current_user.change_user_to_paid
      flash[:notice] = "Your card has been paid!"
      redirect_to root_path(current_user.id)
    else
      redirect_to user_path(current_user.id), alert: "some error occured"
    end
  end

end
