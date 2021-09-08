# frozen_string_literal: true

module OrderHelper
  def total_amount
    @order_items = Cart.where(session_id: current_user.id)
    @order_items.collect { |order_item| (order_item.price * order_item.quantity) }.sum
  end
end
