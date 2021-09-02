# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items, dependent: :destroy

  has_many :order_items
  belongs_to :restaurant
  has_many_attached :item_image

  enum status: {
    publish: 0,
    unpublish: 1
  }

  before_validation :remove_empty_string

  private

  def remove_empty_string
    category_ids.compact
  end
end
