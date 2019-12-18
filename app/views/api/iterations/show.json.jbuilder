# frozen_string_literal: true

json.call(@iteration, :id, :user_id, :starting_question_id, :completion_rate, :completed?, :created_at, :updated_at)
json.recommendations_count @iteration.recommendations.count
