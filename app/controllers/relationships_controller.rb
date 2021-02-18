# frozen_string_literal: true

class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:format])
    current_user.follow(@user)
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_to @user
  end
end
