# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'yaml'
Dir['./db/seeds/*.rb'].each do |file|
  puts "Seeding #{file}..."
  load file
end

questions = {}
Dir['./data/questions/*.yml'].each do |filename|
  category = File.basename(filename, '.yml')
  questions[category] = YAML.safe_load(File.read(filename))
end

Dir['./data/recommendations/*.yml'].each do |filename|
  identifier = File.basename(filename, '.yml')
  recommendation_data = YAML.safe_load(File.read(filename))
  next if recommendation_data.nil?

  recommendation = Recommendation.where(identifier: identifier).first_or_initialize
  recommendation.title = recommendation_data['title']
  recommendation.intro = recommendation_data['intro']
  recommendation.description = recommendation_data['description']
  recommendation.priority = recommendation_data['priority']
  recommendation.save!
end

puts 'Creating questions'
# create all questions first
questions.each do |_category, category_questions|
  category_questions.each do |question_data|
    question = Question.where(identifier: question_data['id']).first_or_initialize
    question.title = question_data['title']
    question.other = question_data['other']
    question.multiple = question_data['multiple']
    question.save!
  end
end
puts "#{Question.count} questions in the database"

puts 'Creating answers'
# now create answers for each question and associate next question
questions.each do |_category, category_questions|
  category_questions.each do |question_data|
    question = Question.find_by!(identifier: question_data['id'])
    question_data['answers'].each do |answer_data|
      answer_data = { 'value' => answer_data } if answer_data.is_a?(String)
      answer = question.answers.find_or_initialize_by(value: answer_data['value'])
      answer.input = answer_data['input']
      answer.next_question = if answer_data['next_question']
                               Question.find_by!(identifier: answer_data['next_question'])
                             else
                               Question.find_by(identifier: question.identifier.to_i + 1)
                             end

      answer.recommendation = Recommendation.find_by(identifier: answer_data['recommendation'])
      answer.save!
    end
  end
end
puts "#{Answer.count} answers in the database"
puts 'DONE'
