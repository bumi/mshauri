# frozen_string_literal: true

class RecommendationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.none unless user

      if user.admin?
        scope.all
      else
        scope.joins(:iterations).where(iterations: { user_id: user.id })
      end
    end
  end
end
