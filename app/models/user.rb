# frozen_string_literal: true
class User < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :restaurant, through: :order_details, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :email, uniqueness: true
  validates :full_name, presence: true
  validates :display_name, length: { in: 2..32 }, allow_blank: true

  enum role: {
    admin: 0,
    user: 1
  }
end
