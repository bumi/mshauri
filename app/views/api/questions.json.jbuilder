# frozen_string_literal: true

json.call(question, :title, :identifier, :multiple)
json.description question.description # TODO: format markdown
json.answers question.answers, partial: 'api/admin/answers/answer', as: :answer
