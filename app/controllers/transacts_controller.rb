class TransactsController < ApplicationController

  before_action :set_item, only: [:index, :pay]
  before_action :set_card, :authenticate_buyer

  def index  
    session[:item_id] = params[:item_id]
    if @card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy'
    )
    @item.update(buyer_id: current_user.id)
    redirect_to done_item_transacts_path
  end

  def done
    @item = Item.find(params[:item_id])
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  private

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
    unless @item.buyer_id.nil?
      redirect_to root_path
    end
  end

  def authenticate_buyer
    @item = Item.find(params[:item_id])
    if @item.seller_id == current_user.id
      redirect_to root_path, alert: '出品者は購入できません'
    end
  end

end
