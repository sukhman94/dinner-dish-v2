# frozen_string_literal: true

class WelcomeController < ApplicationController # rubocop:disable Style/Documentation
  def index
    @product = Item.where(status: 'publish')
    @cart = Cart.new
    @restaurants = Restaurant.all
  end
end
