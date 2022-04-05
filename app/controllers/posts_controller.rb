class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @title = "- #{User.find(params[:user_id]).name}"
    @pagy, @posts = pagy_countless(Post.all_posts_for_a_user(params[:user_id]), link_extra: 'data-remote="true"')
    @comments = ->(post) { Post.five_recent_comments(post) }
    @user = User
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all.where("post_id = #{params[:id]}")
    @user = User
  end

  def new
    @title = '- Add new post'
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @user = User.find(params[:user_id])
    add_post = @user.posts.new(post_params)
    if add_post.save
      Post.update_user_posts_counter(@user)
      flash[:success] = 'Post created successfully'
      redirect_to user_posts_url
    else
      flash.now[:error] = 'Error: Post could not be created'
      render :new, locals: { post: add_post }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
