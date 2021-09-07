# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_items, only: %i[show edit update destroy]
  before_action :gets_cat_res, only: %i[new edit]

  def index
    @items = Item.page params[:page]
    authorize @items
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = 'Items Created Successfully'
      redirect_to items_path
    else
      gets_cat_res
      render 'new'
    end
  end

  def new
    @item = Item.new
    authorize @item
  end

  def update
    if @item.update(item_params)
      flash[:notice] = 'Item Updated Successfully'
      redirect_to items_path
    else
      gets_cat_res
      render 'edit'
    end
  end

  def show
    @cart = Cart.new
  end

  def edit
    authorize @item
  end

  def destroy
    @item.destroy
    flash[:alert] = 'Item Deleted Successfully'
    redirect_to items_path
  end

  # to delete single image
  def delete_image_attachment
    @item_image = ActiveStorage::Attachment.find(params[:id])
    @item_image.purge
    redirect_back(fallback_location: request.referer)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_items
    @item = Item.find_by(id: params[:id])
    content_not_found if @item.blank?
  end

  def gets_cat_res
    @categories = Category.pluck(:name, :id)
    @restaurant = Restaurant.pluck(:name, :id)
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :description, :restaurant_id, :price, :status, item_image: [], category_ids: [])
  end
end
