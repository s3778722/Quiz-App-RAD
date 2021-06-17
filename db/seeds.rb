# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

QuizItem.destroy_all

data = ActiveSupport::JSON.decode(File.read("./quiz.json"))
data.each do |d|
  QuizItem.create!(
    qid: d['id'],
    question: d['question'],
    description: d['description'],
    answers: d['answers'],
    multiple_correct_answers: d['multiple_correct_answers'],
    correct_answers: d['correct_answers'],
    explanation: d['explanation'],
    tip: d['tip'],
    tags: d['tags'],
    category: d['category'],
    difficulty: d['difficulty']
  )
end