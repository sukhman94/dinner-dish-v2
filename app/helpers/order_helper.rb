# frozen_string_literal: true

module OrderHelper
  def total_amount
    @order_items = Cart.where(session_id: current_user.id)
    @order_items.collect { |order_item| order_item.valid? ? (order_item.price * order_item.quantity) : 0 }.sum
  end
end
