class ItemsController < ApplicationController
  def index
  end


  def new
    # ブランドテーブルとのアソシエーションいるなこれ
    @item=Item.new
    @item.images.new
    @category_parent_array=Category.where(ancestry: nil)
  end

  def create
    @item=Item.create(item_params)
    redirect_to root_path
  end


  def show
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :condition, :category_id, :shipping_cost, :condition, :price, :shipping_id, :prefecture_id, :shipping_day, images_attributes:[:image])
  end

end
