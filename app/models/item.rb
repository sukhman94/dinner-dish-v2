# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items, dependent: :destroy

  has_many :order_items, dependent: :destroy
  has_many :carts, dependent: :destroy
  belongs_to :restaurant
  has_many_attached :item_image, dependent: :destroy

  validates :name, presence: true
  validates :status, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  paginates_per 15

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
