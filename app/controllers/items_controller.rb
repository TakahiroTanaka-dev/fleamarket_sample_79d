class ItemsController < ApplicationController
  before_action :move_to_root_path, except:[:index, :show], unless: :user_signed_in?
  before_action :authenticate_user, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :destroy, :edit]

  def index
    @categoryitems = Item.all.order("RAND()")
    @branditems = Item.all.order("id DESC")
  end
  
  def new
    # ブランドテーブルとのアソシエーションいるなこれ
    if user_signed_in?
      @item=Item.new
      @item.images.new
      @category_parent_array=Category.where(ancestry: nil)
    else
      redirect_to new_user_session_path
    end
  end

  def create
    begin
      @item=Item.create(item_params)
      if @item.save
        redirect_to root_path, notice: "出品が完了しました"
      else
        redirect_to new_item_path, alert: "必須項目を入力して下さい"
      end
    rescue 
      redirect_to new_item_path, alert: "必須項目を入力して下さい"
    end
  end

  def show
    @item = Item.find(params[:id])
    @parents = Category.where(ancestry: nil)
    @category_id = @item.category_id
    @child = Category.find(@category_id).parent
    @comment = Comment.new
    @commentALL = @item.comments
  end

  def edit
    @item.images.new
    
    grandchild_category = @item.category
    child_category = grandchild_category.parent


    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << [parent.name, parent.id]
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end

  def update
    begin
      @item=Item.find(params[:id])
      if @item.update(item_params)
          redirect_to item_path, notice: "編集が完了しました"
      else
        redirect_to edit_item_path(@item), alert: "必須項目を入力して下さい"
      end
    rescue
      redirect_to edit_item_path(@item), alert: "必須項目を入力して下さい"
    end
  end


  def get_category_children
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
      end
    end
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    respond_to do |format|
      format.html
      format.json do
        @grandchildren = Category.find(params[:child_id]).children
      end
    end
  end


  def destroy
    if @item.destroy
      redirect_to root_path, notice: "削除が完了しました"
    else
      redirect_to :show, alert: "削除できませんでした"
    end
  end


  private
  def item_params
    params.require(:item).permit(:name, :description, :condition, :category_id, :shipping_cost, :condition, :price, :shipping_id, :prefecture_id, :shipping_day, images_attributes:[:image, :id, :_destroy]).merge(seller_id: current_user.id)
  end

  def move_to_root_path
    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def authenticate_user
    if Item.find(params[:id]).seller != current_user
      redirect_to root_path
    end
  end
end
