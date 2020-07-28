class ItemsController < ApplicationController
  def index
  end


  def new
    # ブランドテーブルとのアソシエーションいるなこれ
    @item=Item.new
    @item.images.new
    @category_parent_array=["---"]
    @category_parent_array=Category.where(ancestry: nil)
  end

  def create
    binding.pry
    @item=Item.new(item_params)
    if @items.images.present?
      @item.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  def show
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :condition, :price, :shipping_id, :prefecture_id, :shipping_day)
  end

end
