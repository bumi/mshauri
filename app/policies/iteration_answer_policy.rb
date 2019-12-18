# frozen_string_literal: true

class IterationAnswerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.none unless user

      if user.admin?
        scope.all
      else
        scope.joins(:iteration).where(iterations: { user_id: user.id })
      end
    end
  end
end
