class UsersController < ApplicationController
  before_action :check_if_user_signed_in

  def index
    @users = User.order(id: :desc).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def check_if_user_signed_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
