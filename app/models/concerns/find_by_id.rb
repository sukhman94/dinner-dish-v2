# frozen_string_literal: true

module FindById
  extend ActiveSupport::Concern

  included do
    scope :where_id, ->(id) { find_by(id: id) }
  end
end
