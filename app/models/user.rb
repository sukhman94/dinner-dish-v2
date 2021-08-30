class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
