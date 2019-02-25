class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :user_id, optional:true
  has_many :questions#, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages

  scope :easy,   -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard,   -> { where(level: 5..Float::INFINITY) }
  scope :categories_by_name, -> (name) { joins(:category).where(categories: {title: name}) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validate :validate_max_level, on: :create

  def self.by_name(name)
    categories_by_name(name).order(title: :desc).pluck(:title)
  end

  private

  def validate_max_level
    errors.add(:level) if level.to_i > 10
  end
end
