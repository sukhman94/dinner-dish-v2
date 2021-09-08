# frozen_string_literal: true

class AddIndexesAndNull < ActiveRecord::Migration[5.2]
  def change # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    add_index :carts, %i[session_id item_id]
    add_index :items, :status

    change_table :carts, bulk: true do |t|
      t.integer :quantity, null: false
      t.integer :price, null: false
    end

    change_table :category_items, bulk: true do |t|
      t.bigint :item_id, null: false
      t.bigint :category_id, null: false
    end

    change_table :items, bulk: true do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :status, null: false
      t.bigint :restaurant_id, null: false
      t.float :price, null: false
    end

    change_table :order_details, bulk: true do |t|
      t.string :address, null: false
      t.string :phone, null: false
      t.integer :status, null: false
      t.bigint :user_id, null: false
      t.bigint :restaurant_id, null: false
      t.float :total, null: false
    end

    change_table :order_items, bulk: true do |t|
      t.integer :quantity, null: false
      t.bigint :order_detail_id, null: false
      t.bigint :item_id, null: false
      t.float :price, null: false
    end

    change_table :restaurant_items, bulk: true do |t|
      t.bigint :item_id, null: false
      t.bigint :restaurant_id, null: false
    end

    change_table :restaurants, bulk: true do |t|
      t.string :name, null: false
      t.string :description, null: false
    end

    change_column :categories, :name, :string, null: false
  end
end
