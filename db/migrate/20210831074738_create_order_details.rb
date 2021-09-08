# frozen_string_literal: true

class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.integer :total
      t.references :restaurant, foreign_key: true
      t.integer :status
      t.string :phone

      t.timestamps
    end
  end
end
