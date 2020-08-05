class UsersController < ApplicationController
  before_action :authenticate_user, only: :show
  def show
  end

  private

  def authenticate_user
    unless user_signed_in? && current_user == User.find(params[:id])
      redirect_to root_path
    end
  end
end
