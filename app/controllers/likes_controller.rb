class LikesController < ApplicationController
  def create
    user_post = Post.find(params[:post_id])
    user = User.find(params[:user_id])
    @like = Like.create(author_id: user.id, post_id: user_post.id)
    if @like.save
      Like.update_likes_counter(user_post)
      flash[:success] = 'Your like has been added!'

    else
      flash.now[:error] = 'Like could not be added'
    end
    redirect_to user_post_path(user.id, user_post.id)
  end
end
