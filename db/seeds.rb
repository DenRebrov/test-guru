# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category = Category.create(title: 'Ruby')
test = Test.create(category_id: category.id, title: 'Ruby Interview Questions', level: 0)
question = Question.create(test_id: test_id, body: 'How will you define Ruby programming Language?')
answer = Answer.create(question_id: question.id, correct: false)