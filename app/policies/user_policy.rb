# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    return false unless user

    user.admin? || user.id == record.id
  end

  class Scope < Scope
    def resolve
      return scope.none unless user

      if user.admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end
end
