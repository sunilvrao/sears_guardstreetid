class HomeController < ApplicationController

def index
p request.subdomain
session[:subdomain] = request.subdomain
if request.subdomain == 'sears'
render layout: 'sears'
end
end

  def submit_coupon
    response = RestClient.post ENV['GUARDSTREET_URL'] + 'submit_coupon', {"coupon_code" => params[:coupon][:code]}, :verify_ssl => false
    @res = JSON(response)
    p @res
    render 'index.js.erb' and return
  end

  def shopping_cart
  end

  def register
	response = RestClient.post ENV['GUARDSTREET_URL'] + 'charge', {"utf8" => "✓", "authenticity_token" => "oIfQ4qaX99TkzCnxMsmojbXGsaSPEYmZeXREySIWmXo=", :timeout => 90,
                                                                   "cvv" => params[:cvv],
                                                                   "expiry_date" => params[:expiry_date],
                                                                   "expiry_year" => params[:expiry_year],
                                                                   "source" => {"lead_source" => 'sears_retail', "product_name" => params[:source][:product_name], "campaign_code" => 'sears_retail', "external_id" => '', "role" => '', "coupon_code" => params[:source][:promo_code]},
                                                                   "user" => {"email" => params[:user][:email], "first_name" => params[:user][:first_name], "last_name" => params[:user][:last_name], phone: params[:user][:phone]},
                                                                   "billing_address" => {"address" => params[:billing_address][:address], "city" => params[:billing_address][:city], "state" => params[:billing_address][:state], "zipcode" => params[:billing_address][:zipcode]},
                                                                   "card" => {"card_number" => params[:card][:card_number]}, "order" => {"token" => ""}}
	@response = response
  end

  def sign_in
	redirect_to ENV['GUARDSTREET_URL'] + "user/login_from_gslanding?user[email]=#{params[:user][:email]}&user[password]=#{params[:user][:password]}&domain=guardstreetid" and return
  end

end
