# frozen_string_literal: true

class CartsController < ApplicationController # rubocop:disable Style/Documentation
  def new; end

  def index
    @items = Cart.joins(:item).where(session_id: session_id)
  end

  def create
    if current_order(params[:cart][:item_id])
      @cart = Cart.new(cart_params)
      @cart.session_id = session_id
      flash[:notice] = @cart.save ? 'Added to cart' : 'Error Occured in uploading try in a moment'
    else
      flash[:notice] = 'Product is already in the cart'
    end
    redirect_to root_path
  end

  def update
    @cart_item = Cart.update(params[:id].to_i, { quantity: params[:quantity].to_i })
    redirect_to carts_path
  end

  def destroy
    @cart_item = Cart.find(params[:id])
    @cart_item.destroy
  end

  private

  def cart_params
    params.require(:cart).permit(:item_id, :quantity, :price)
  end
end
