# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :item

  scope :current_user_cart, ->(session_id) { joins(:item).where(session_id: session_id) }
end
