# frozen_string_literal: true

class AddDefaultToStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_default :order_details, :status, 0
  end
end
