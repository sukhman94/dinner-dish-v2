# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]
  def index
    @categories = Category.all
    authorize @categories
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
    authorize @category
  end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category Updated Successfully'
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def edit
    authorize @category
  end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find_by(id: params[:id])
    content_not_found if @category.blank?
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end
end
