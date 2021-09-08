# frozen_string_literal: true

class RestaurantPolicy < ApplicationPolicy
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

  def destroy?
    user&.admin?
  end
end
