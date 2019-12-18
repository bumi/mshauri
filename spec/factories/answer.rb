# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :answer do
    association :question
    value { Faker::Lorem.word }
  end
end
