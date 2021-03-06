# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :question do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph(sentence_count: rand(2..8)) }
  end
end
