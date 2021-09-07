# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    @items = Cart.joins(:item).where(session_id: session_id)
  end

  # rubocop:disable Metrics/AbcSize
  def create
    if current_order(params[:cart][:item_id])
      if params[:cart][:restaurant_id].to_i == restaurant_ids.to_i || restaurant_ids.to_i.zero?
        @cart = Cart.new(cart_params)
        @cart.session_id = session_id
        flash[:notice] = @cart.save ? 'Added to cart' : 'Error Occured in uploading try in a moment'
      else
        flash[:notice] = 'Can not add more than one restaurant products'
      end
    else
      flash[:notice] = 'Product is already in the cart'
    end
    redirect_back(fallback_location: root_path)
  end
  # rubocop:enable Metrics/AbcSize

  def update
    @cart_item = Cart.update(params[:id].to_i, { quantity: params[:quantity].to_i })
    redirect_to carts_path
  end

  def destroy
    @cart_item = Cart.find_by(id: params[:id])
    content_not_found if @cart_item.blank?
    @cart_item.destroy
    redirect_to carts_path
  end

  private

  def cart_params
    params.require(:cart).permit(:item_id, :quantity, :price)
  end
end
