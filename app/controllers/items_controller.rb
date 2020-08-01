class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @categoryitems = Item.all.order("RAND()")
    @branditems = Item.all.order("id DESC")
  end

  def new
    
  end

  def create

  end


  def show
  end

  private
  def item_params
    params.require(:item)
      .permit(:name, :description, :condition, :category_id, :shipping_cost, :condition, :price, :shipping_id, :prefecture_id, :shipping_day, images_attributes:[:image])
      .merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

