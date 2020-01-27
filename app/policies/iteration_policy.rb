# frozen_string_literal: true

class IterationPolicy < ApplicationPolicy
  def create?
    return false unless user

    user.id == record.user_id
  end

  def show?
    return false unless user

    user.admin? || user.id == record.user_id
  end

  class Scope < Scope
    def resolve
      return scope.none unless user

      if user.admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end
end
