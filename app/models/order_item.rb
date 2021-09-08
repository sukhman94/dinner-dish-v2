# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order_detail
  belongs_to :item

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }
end
