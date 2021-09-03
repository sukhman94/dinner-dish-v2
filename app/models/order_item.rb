# frozen_string_literal: true

class OrderItem < ApplicationRecord # rubocop:disable Style/Documentation
  before_save :set_unitprice
  # before_save :set_totalprice

  belongs_to :order_detail
  belongs_to :item

  def unit_price
    if persisted?
      self[:price]
    else
      item.price
    end
  end

  # def total_price
  #   unit_price * quantity
  # end

  private

  def set_unitprice
    self[:price] = unit_price
  end

  # def set_totalprice

  #   self[:total] = quantity * set_unitprice
  # end
end
