# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :question do
    title { Faker::String.random }
    identifier { Faker::Number.rand }
    description { Faker::Lorem.paragraph(rand(2..8)) }
    multiple { Faker::Boolean.rand }
    entry { false }
  end
end
