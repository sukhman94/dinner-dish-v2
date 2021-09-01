# frozen_string_literal: true

class Restaurant < ApplicationRecord
  has_many :order_details
  has_many :users, through: :order_details
  has_many :items

  has_one_attached :avatar
end
