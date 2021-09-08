# frozen_string_literal: true

class OrderDetail < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :user
  belongs_to :restaurant

  has_many :order_items, dependent: :destroy

  validates :phone, presence: true,
                    numericality: true,
                    length: { minimum: 10, maximum: 15 }

  validates :address, presence: true

  enum status: {
    ordered: 0,
    paid: 1,
    cancelled: 2,
    completed: 3
  }

  # paginates_per 5

  after_save :switch_data

  # rubocop:disable Metrics/MethodLength
  def switch_data
    order_id = self[:id]
    user_id = self[:user_id]
    Cart.where(session_id: user_id).each do |cart|
      order_item = OrderItem.create(
        order_detail_id: order_id,
        item_id: cart.item_id,
        quantity: cart.quantity,
        price: cart.price
      )
      order_item.save!
      cart.destroy
    end
  end
  # rubocop:enable Metrics/MethodLength
end
