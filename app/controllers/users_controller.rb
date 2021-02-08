class UsersController < ApplicationController
  def index
    @users = User.order(id: :desc).page(params[:page])
  end
end
