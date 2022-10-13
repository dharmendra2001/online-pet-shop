class ApplicationController < ActionController::Base
  rescue_from Stripe::APIConnectionError do
    flash[:alert] = 'No internet connection available. Please try again later.'     
    redirect_to root_path
  end

  rescue_from Stripe::InvalidRequestError do
    flash[:alert] = 'Could not find payment information'    
    redirect_to root_path
  end
end
