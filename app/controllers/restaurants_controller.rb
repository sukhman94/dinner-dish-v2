# frozen_string_literal: true

class RestaurantsController < ApplicationController # rubocop:disable Style/Documentation
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = 'Restaurant Created Successfully'
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = 'Restaurant Updated Successfully'
      redirect_to restaurants_path
    else
      render 'edit'
    end
  end

  def edit; end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find_by(id: params[:id])
    content_not_found unless @restaurant.present?
  end

  # Only allow a list of trusted parameters through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :avatar)
  end
end
