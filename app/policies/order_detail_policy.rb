# frozen_string_literal: true

class OrderDetailPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user&.admin? || user&.user?
  end

  def new?
    user&.user?
  end

  def create?
    user&.user?
  end
end
