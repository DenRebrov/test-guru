class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', optional:true
  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :easy, -> { where(level: 0..1).order(level: :asc)}
  scope :medium, -> { where(level: 2..4).order(level: :asc)}
  scope :hard, -> { where(level: 5..Float::INFINITY).order(level: :asc)}
  scope :categories_by_name, -> (name) { joins(:category).where(categories: {title: name}).order('tests.title DESC').pluck('tests.title') }

  validates :title, presence: true,
                    uniqueness: true

  validates :level, uniqueness: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  validate :validate_max_level, on: :create

  #def self.categories_by_name(name)
  #  Test.joins(:category).where(categories: {title: name}).order('tests.title DESC').pluck('tests.title')
  #end

  private

  def validate_max_level
    errors.add(:level) if level.to_i > 10
  end
end
