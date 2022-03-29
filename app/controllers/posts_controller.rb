class PostsController < ApplicationController
  def index
    @title = "- #{User.find(params[:user_id]).name}"
    @pagy, @posts = pagy_countless(Post.all_posts_for_a_user(params[:user_id]),link_extra: 'data-remote="true"')
    @comments = ->(post) { Post.five_recent_comments(post) }
    @user = User
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all.where("post_id = #{params[:id]}")
    @user = User
  end
  
end
