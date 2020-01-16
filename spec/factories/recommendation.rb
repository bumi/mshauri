# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :recommendation do
    identifier { Faker::Number.rand }
    title { Faker::String.random }
    intro { Faker::String.random }
    description { Faker::Lorem.paragraph(rand(2..8)) }
    priority { Faker::Number.digit }
  end
end
