# frozen_string_literal: true

class AddFieldToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :full_name, :string, null: false, limit: 32
    add_column :users, :display_name, :string, null: true, limit: 25
    add_column :users, :role, :integer, default: 1
  end
end
