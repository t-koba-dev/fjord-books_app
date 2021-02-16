# frozen_string_literal: true

class CommentsController < ApplicationController
  def new; end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.save
    redirect_to @commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end
end
