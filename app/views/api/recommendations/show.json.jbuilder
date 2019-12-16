# frozen_string_literal: true

json.call(@recommendation, :id, :title, :intro, :priority)
json.description @recommendation.description
json.description_formatted @recommendation.description_formatted
