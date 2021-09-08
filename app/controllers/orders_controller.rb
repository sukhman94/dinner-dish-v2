# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    authorize @orders = if current_user.admin?
                          OrderDetail.page params[:page]
                        else
                          OrderDetail.where(user_id: current_user.id).page params[:page]
                        end
  end

  def new
    @order = OrderDetail.new
    authorize @order
  end

  def create
    @order = authorize OrderDetail.create(order_params)
    if @order.save
      flash[:notice] = 'Your Order has been placed Successfully'
      OrderMailer.with(order: @order).new_order_email.deliver_later
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @order_item = OrderItem.where(order_detail_id: params[:id])
    @status = OrderDetail.where_id(params[:id])
    content_not_found unless @order_item.present? || @status.present?
  end

  def update
    @update = OrderDetail.update(params[:id], update_params)
    OrderStatusMailer.with(order: @update).order_status_email.deliver_later if @update.cancelled?
    redirect_to order_path
  end

  private

  def order_params
    params.require(:order_detail).permit(:address, :phone, :user_id, :restaurant_id, :grand_total)
  end

  def update_params
    params.require(:order_detail).permit(:status)
  end
end
