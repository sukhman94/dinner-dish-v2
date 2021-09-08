# frozen_string_literal: true

module Plucked
  extend ActiveSupport::Concern

  included do
    scope :plucked, -> { pluck(:name, :id) }
  end
end
