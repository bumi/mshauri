# frozen_string_literal: true

json.call(iteration, :id, :starting_question_id, :completion_rate, :created_at)
json.completed iteration.completed?
