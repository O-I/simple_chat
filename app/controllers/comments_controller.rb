class CommentsController < ApplicationController

  def index
    @comments = Comment.where('id > ?', params[:after_id].to_i)
                       .order('created_at DESC')
  end

  def new
    @comment = Comment.new
    @comments = Comment.order('created_at DESC')
  end

  def create
    if current_user
      @comment = current_user.comments.build(comment_params)
      @comment.save
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end