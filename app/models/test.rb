class Test < ApplicationRecord
  belongs_to :category

  def self.categories_by_name(name)
    Test.joins('INNER JOIN categories ON category_id = test.id').where(categories: {title: name}).order('tests.title DESC')
  end
end
