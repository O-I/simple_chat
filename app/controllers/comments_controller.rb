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
    respond_to do |format|
      if current_user
        @comment = current_user.comments.build(comment_params)

        if @comment.save
          flash.now[:success] = 'Your comment was successfully posted'
        else
          flash.now[:error] = 'Your comment could not be saved'
        end
        
        format.html { redirect_to root_url }
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end