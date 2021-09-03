# frozen_string_literal: true

class WelcomeController < ApplicationController # rubocop:disable Style/Documentation
  def index
    @product = Item.all
    @cart = Cart.new
  end
end
