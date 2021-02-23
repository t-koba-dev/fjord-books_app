# frozen_string_literal: true

class CommentsController < ApplicationController
  def new; end

  def create
    @commentable.comments.create!(comment_params)
    redirect_to @commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end
end
