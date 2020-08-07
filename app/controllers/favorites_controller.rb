class FavoritesController < ApplicationController
  before_action :set_item, only: [:create, :destroy]

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.new(
      user_id: current_user.id, 
      item_id: @item.id
    )
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find_by(
      user_id: current_user.id, 
      item_id: @item.id
    )
    @favorite.destroy
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end

