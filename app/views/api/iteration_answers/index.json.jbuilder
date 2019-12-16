json.array! @iteration_answers do |iteration_answer|
    json.call(iteration_answer.answer, :id,  :value, :score, :input)
    json.custom_input iteration_answer.value
    json.question iteration_answer.question, :id, :title, :description
end