# frozen_string_literal: true

json.array! @users do |user|
    json.call(user, :id, :name, :email, :slug)
    json.iterations user.iterations, partial: 'api/iterations/iteration', as: :iteration 
    json.answers user.answers, partial: 'api/answers/answer', as: :answer
  end