class ItemsController < ApplicationController
  def index
  end


  def new
    @item=Item.new
    @item.images.new
  end

  def create

  end


  def show
  end

end
