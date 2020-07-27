class ItemsController < ApplicationController
  def index
  end


  def new
    @item=Item.new
    @item.images.new
  end

  def create
    @item=Item.create(item_params)
  end


  def show
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :condition, :price, :shipping_id, :prefecture_id, :shipping_day)
  end

end
