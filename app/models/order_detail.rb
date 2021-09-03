# frozen_string_literal: true

class OrderDetail < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :user
  belongs_to :restaurant

  has_many :order_items, dependent: :destroy

  enum status: {
    ordered: 0,
    paid: 1,
    cancelled: 2,
    completed: 3
  }

  after_save :switch_data

  # rubocop:disable Metrics/MethodLength
  def switch_data
    order_id = self[:id]
    user_id = self[:user_id]
    Cart.where(session_id: user_id).each do |cart|
      order_item = OrderItem.first_or_initialize(
        order_detail_id: order_id,
        item_id: cart.item_id,
        quantity: cart.quantity,
        price: cart.price
      )
      order_item.save!
    end
    Cart.where(session_id: user_id).destroy_all
  end
  # rubocop:enable Metrics/MethodLength
end
