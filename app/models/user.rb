class User < ApplicationRecord
  has_secure_password
  has_many :appointments

  validates :email, presence: true
  validates :password, presence: true, on: :create
end
