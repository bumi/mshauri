# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :iteration do
    user { FactoryBot.create(:user) }
    after(:build) { FactoryBot.create(:question, entry: true) }
  end
end
