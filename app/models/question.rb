class Question < ApplicationRecord
  belongs_to :test#, optional: true
  has_many :answers#, dependent: :destroy
  has_many :gists

  validates :body, presence: true
end
