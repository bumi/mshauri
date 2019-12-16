# frozen_string_literal: true

json.call(@question, :id, :title, :identifier, :multiple)
json.description @question.description
json.description_formatted @question.description_formatted
json.answers @question.answers, partial: 'api/answers/answer', as: :answer
