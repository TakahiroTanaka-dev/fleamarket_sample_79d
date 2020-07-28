class CardsController < ApplicationController

  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay
  
  end

  def delete

  end

  def show

  end
  
end
