class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy, :restore]
  before_action :check_user, only: [:update, :destroy, :restore]

  def create
    @comment = Comment.new(comment_params)
    @seller_of_item = @comment.item.seller
    if @comment.save
      respond_to do |format|
        format.json
      end
    else
      flash[:alert] = "保存できていません"
      redirect_to item_path(params[:id])
    end
  end

  def update
    @comment.update(delete_check:1)
  end

  def restore
    @comment.update(delete_check:0)
    @seller_of_item = @comment.item.seller
    respond_to do |format|
      format.json
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :item_id).merge(user_id: current_user.id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def check_user
    unless @comment.item.seller == current_user
      flash[:alert] = "その操作はできません"
      redirect_to root_path
    end
  end

end
