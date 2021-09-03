# frozen_string_literal: true

class Restaurant < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :users, through: :order_details, dependent: :destroy
  has_many :items, dependent: :destroy

  has_one_attached :avatar
end
