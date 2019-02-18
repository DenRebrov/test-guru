# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

answer = Answer.create(question_id: 1, correct: false)
category = Category.create(title: 'Ruby')
question = Question.create(test_id: 1, body: 'How will you define Ruby programming Language?')
test = Test.create(category_id: 1, title: 'Ruby Interview Questions', level: 0)