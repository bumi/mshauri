# frozen_string_literal: true

json.array! @iteration_answers do |iteration_answer|
  json.call(iteration_answer, :id, :value)
  json.answer iteration_answer.answer, partial: 'api/answers/answer', as: :answer
  json.question iteration_answer.question, :id, :title, :description
end
