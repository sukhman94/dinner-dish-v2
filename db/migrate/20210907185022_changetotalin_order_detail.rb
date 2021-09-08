# frozen_string_literal: true

class ChangetotalinOrderDetail < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_details, :total, :grand_total
  end
end
