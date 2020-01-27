# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :iteration do
    association :user
  end
end
