# frozen_string_literal: true

questions = {}
Dir['./data/questions/*.yml'].each do |filename|
  category = File.basename(filename, '.yml')
  questions[category] = YAML.safe_load(File.read(filename))
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
