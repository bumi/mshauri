# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :iteration_answer do
    association :iteration
    association :question
    association :answer
  end
end
