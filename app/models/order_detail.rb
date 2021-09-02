# frozen_string_literal: true

class OrderDetail < ApplicationRecord # rubocop:disable Style/Documentation
  before_save :sub_total
  before_validation :current_user
  belongs_to :user
  belongs_to :restaurant

  has_many :order_items

  def subtotal
    order_items.collect { |order_item| order_item.valid? ? (order_item.price * order_item.quantity) : 0 }.sum
  end

  private

  def sub_total
    self[:total] = subtotal
  end

  def current_user
    self[:user_id] = 1
    self[:restaurant_id] = 5
  end
end
