class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users

  validates :email, presence: true
  validates :email, format: { with: /\A[a-zA-Z0-9._+]+@[a-zA-Zа-яА-Я._+]+\.[a-zа-я]+\z/, message: "it is not email" }

  def tests_by_level(level)
    tests.where(level: level)
  end
end
