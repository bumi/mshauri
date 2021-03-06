# frozen_string_literal: true

json.call(@user, :id, :name, :email, :slug, :created_at)
json.iterations @user.iterations, partial: 'api/iterations/iteration', as: :iteration
