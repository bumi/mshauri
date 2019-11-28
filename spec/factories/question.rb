# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :question do
    title { Faker::String.random }
    description { Faker::Lorem.paragraph(rand(2..8)) }
  end
end
