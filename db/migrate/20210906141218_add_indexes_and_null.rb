# frozen_string_literal: true

class AddIndexesAndNull < ActiveRecord::Migration[5.2]
  def change # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    add_index :carts, [:session_id, :item_id]
    add_index :items, :status

    change_column :carts, :quantity, :integer, null: false
    change_column :carts, :price, :integer, null: false
    change_column :categories, :name, :string, null: false
    change_column :category_items, :item_id, :bigint, null: false
    change_column :category_items, :category_id, :bigint, null: false
    change_column :items, :name, :string, null: false
    change_column :items, :status, :integer, null: false
    change_column :items, :description, :string, null: false
    change_column :items, :restaurant_id, :bigint, null: false
    change_column :items, :price, :float, null: false
    change_column :order_details, :user_id, :bigint, null: false
    change_column :order_details, :address, :string, null: false
    change_column :order_details, :total, :float, null: false
    change_column :order_details, :restaurant_id, :bigint, null: false
    change_column :order_details, :status, :integer, null: false
    change_column :order_details, :phone, :string, null: false
    change_column :order_items, :order_detail_id, :bigint, null: false
    change_column :order_items, :item_id, :bigint, null: false
    change_column :order_items, :quantity, :integer, null: false
    change_column :order_items, :price, :float, null: false
    change_column :restaurant_items, :item_id, :bigint, null: false
    change_column :restaurant_items, :restaurant_id, :bigint, null: false
    change_column :restaurants, :name, :string, null: false
    change_column :restaurants, :description, :string, null: false
  end
end
