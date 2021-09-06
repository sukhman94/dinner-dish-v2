# frozen_string_literal: true

class ItemPolicy < ApplicationPolicy # rubocop:disable Style/Documentation
  class Scope < Scope # rubocop:disable Style/Documentation
    def resolve
      scope.all
    end
  end

  def edit?
    user.admin?
  end

  def index?
    user.admin?
  end
end
