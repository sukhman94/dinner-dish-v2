# frozen_string_literal: true

module Findable
  extend ActiveSupport::Concern

  included do
    scope :where_id, ->(id) { find_by(id: id) }
  end
end
