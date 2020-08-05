class UsersController < ApplicationController
  before_action :authenticate_user, only: :show
  def show
  end

  def bought_item
    @item = Item.where(buyer_id: current_user.id)
  end

  private

  def authenticate_user
    unless user_signed_in? && current_user == User.find(params[:id])
      redirect_to root_path
    end
  end
end
