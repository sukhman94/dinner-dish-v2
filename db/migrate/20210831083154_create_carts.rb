# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :session_id
      t.references :item, foreign_key: true
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
