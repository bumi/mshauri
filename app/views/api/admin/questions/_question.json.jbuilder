json.(question, :title, :identifier, :multiple)
json.description question.description # TODO: format markdown
json.answers question.answers, partial: 'api/admin/answers/answer', as: :answer
