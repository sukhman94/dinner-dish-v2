# frozen_string_literal: true

class OrdersController < ApplicationController # rubocop:disable Style/Documentation
  def index
    @orders = if current_user.admin?
                OrderDetail.page params[:page]
              else
                OrderDetail.where(user_id: current_user.id).page params[:page]
              end
  end

  def new
    @order = OrderDetail.new
  end

  def create
    @order = OrderDetail.create(order_params)
    @order.total = total_amount.to_i
    if @order.save
      flash[:notice] = 'Your Order has been placed Successfully'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @order_item = OrderItem.where(order_detail_id: params[:id])
    @status = OrderDetail.find_by(id: params[:id])
    content_not_found unless @order_item.present? || @status.present?
  end

  def update
    @update = OrderDetail.update(params[:id], update_params)
    redirect_to order_path
  end

  private

  def order_params
    params.require(:order_detail).permit(:address, :phone, :user_id, :restaurant_id)
  end

  def update_params
    params.require(:order_detail).permit(:status)
  end
end
