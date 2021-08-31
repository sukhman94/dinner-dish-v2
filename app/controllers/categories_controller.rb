# frozen_string_literal: true

class CategoriesController < ApplicationController # rubocop:disable Style/Documentation
  before_action :set_category, only: %i[edit update destroy]
  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category Created Successfully'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def new
    @category = Category.new
  end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category Updated Successfully'
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def edit; end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end
end
