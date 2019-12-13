# frozen_string_literal: true

class UserPolicy
  attr_policy :user
  def initialize(user)
    @user = user
  end

  def admin_dashboard?
    user.admin?
  end
end
