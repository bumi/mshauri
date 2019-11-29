# frozen_string_literal: true

question1 = Question.where(title: 'How many people work in your company?').first_or_create!
question2 = Question.where(title: 'How many people are directly involved in software development at your company').first_or_create!
question3 = Question.where(title: 'Are you planing to hire new people in the next year?').first_or_create!

[
  '< 5',
  '5 - 10',
  '11 - 25',
  '26 - 50',
  'more',
].each do |answer|
  Answer.where(question: question1, value: answer).first_or_create!(next_question: question2)
end

[
  '< 5',
  '5 - 10',
  '11 - 25',
  'more',
].each do |answer|
  Answer.where(question: question2, value: answer).first_or_create!(next_question: question3)
end
