# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order_detail
  belongs_to :item
end
