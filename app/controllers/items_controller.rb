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

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      if item.destroy
        redirect_to root_path, notice: "削除が完了しました"
      else
        redirect_to root_path, alert: "削除が失敗しました"
      end
    end
  end

end