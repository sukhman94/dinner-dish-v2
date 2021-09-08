# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order_detail, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
