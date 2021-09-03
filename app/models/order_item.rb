# frozen_string_literal: true

class OrderItem < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :order_detail
  belongs_to :item
end
