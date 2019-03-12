class Badge < ApplicationRecord
  has_many :users, through: :user_badges
  has_many :user_badges, dependent: :destroy

  validates :title, presence: true
end
