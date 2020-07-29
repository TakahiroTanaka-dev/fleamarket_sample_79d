class ItemsController < ApplicationController
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

end

