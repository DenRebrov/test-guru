class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', optional:true
  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.categories_by_name(name)
    Test.joins(:category).where(categories: {title: name}).order('tests.title DESC').pluck('tests.title')
  end
end
