# frozen_string_literal: true

class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    user&.admin?
  end

  def index?
    user&.admin?
  end

  def new?
    user&.admin?
  end

  def show?
    user&.admin? || user&.user?
  end

  def create?
    user&.admin?
  end

  def update?
    user&.admin?
  end

  def destroy?
    user&.admin?
  end
end
