# frozen_string_literal: true

class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @restaurants = Restaurant.all
    authorize @restaurants
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
    authorize @restaurant
  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = 'Restaurant Updated Successfully'
      redirect_to restaurants_path
    else
      render 'edit'
    end
  end

  def edit
    authorize @restaurant
  end

  def show
    @items = Item.where(restaurant_id: params[:id], status: 'publish')
    @categories = Category.all
    @cart = Cart.new
  end

  def destroy
    authorize @restaurant
    @restaurant.destroy
    respond_to do |format|
      format.js { render 'restaurant.js.erb' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.where_id(params[:id])
    content_not_found if @restaurant.blank?
  end

  # Only allow a list of trusted parameters through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :avatar)
  end
end
