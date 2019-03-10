class Badge < ApplicationRecord
  has_many :users, through: :user_badges
  has_many :user_badges, dependent: :destroy

  validates :title, presence: true

  #def select(level)
    #user.tests_by_level(level)
    #Badge.join('users').where(user.tests_by_level(level))
    #Badge.join('test_passages').where('test_passage.success? = true')
  #end
end
