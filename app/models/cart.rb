# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :item

  validates :session_id, presence: true
  validates :item_id, presence: true
  validates :quantity, presence: true, numericality: true
  validates :item_id, presence: true

  scope :current_user_cart, ->(session_id) { where(session_id: session_id) }
end
