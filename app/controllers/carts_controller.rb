class CartsController < ApplicationController
def create
    @cart = Cart.where(uuid: session['cart']).first
    if @cart && @cart.products
      @cart.products = Array.wrap(params["product_id"])
    else
      @cart = Cart.new(uuid: session['cart'], products: Array.wrap(params["product_id"]))
    end
    @cart.status = nil
    @cart.save
    redirect_to carts_path
  end
end
