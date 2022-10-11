class ApplicationController < ActionController::Base
  rescue_from Stripe::APIConnectionError do
    flash[:alert] = 'No internet connection detected'    
    redirect_to root_path
  end
end
