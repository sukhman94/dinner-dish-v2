# frozen_string_literal: true

class OrdersController < ApplicationController # rubocop:disable Style/Documentation
  def new
    @orderdetails = OrderDetail.new
  end

  def create
    @order = OrderDetail.create(order_params)
    @order.total = total_amount.to_i
    flash[:notice] = @order.save ? 'Your Order has been placed Successfully' : 'There is an error in processing try back in a moment'
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order_detail).permit(:address, :phone, :user_id, :restaurant_id)
  end
end
