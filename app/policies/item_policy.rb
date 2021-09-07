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
end
