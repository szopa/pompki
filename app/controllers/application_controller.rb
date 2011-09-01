class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound do |ex|
    flash[:error] = "ACCESS DENIED!"
    redirect_to root_url
  end
  rescue_from ActiveRecord::RecordInvalid do |ex|
  end


end
