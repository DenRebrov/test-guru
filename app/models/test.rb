class Test < ApplicationRecord
  belongs_to :category

  def self.categories_by_name(name)
    Test.joins(:category).where(categories: {title: name}).order('tests.title DESC').pluck('tests.title')
  end
end
