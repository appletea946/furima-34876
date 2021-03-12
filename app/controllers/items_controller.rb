class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      item_params.each do |key, value|
        @item[key] = value
      end
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_charges_id, :prefecture_id, :days_to_ship_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
