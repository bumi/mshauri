
require 'faker'
FactoryBot.define do
  factory :user do
    name { "lewis"}
    email { "lewisdylan@gmail.com" }
  end
end
