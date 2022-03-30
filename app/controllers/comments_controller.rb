class CommentsController < ApplicationController
  def new
    @title = '- Add new comment'
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
     @user = User.find(params[:user_id])
     post = @user.posts.find(params[:post_id])
    add_comment = @user.comments.new(post_id: post.id, text:comment_params[:text])
    if add_comment.save
      Comment.update_comments_counter(post)
      flash[:success] = 'comment created successfully'
      redirect_to user_post_url(@user.id,post.id)
    else
      flash.now[:error] = 'Error: comment could not be created'
      render :new, locals: { comment: add_comment }
    end
  end
  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
