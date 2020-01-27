# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :recommendation do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph(sentence_count: rand(2..8)) }
    identifier { Faker::Lorem.word }
  end
end
