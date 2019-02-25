class User < ApplicationRecord
  EMAIL_FORMAT = /\A[a-zA-Z0-9._+]+@[a-zA-Zа-яА-Я._+]+\.[a-zа-я]+\z/

  has_many :test_passages
  has_many :tests, through: :test_passages
  #has_many :authorized_tests, class_name: 'Test', foreign_key: :user_id

  validates :email, presence: true
  validates :email, format: { with: EMAIL_FORMAT, message: "it is not email" }

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
