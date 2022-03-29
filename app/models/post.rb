class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  scope :update_user_posts_counter, ->(user) { user.update(posts_counter: user.posts.count) }

  scope :five_recent_comments, ->(post) { Comment.all.where("post_id = #{post.id}").order(id: :DESC).limit(5) }

  scope :all_posts_for_a_user, ->(author_id) { Post.all.where("author_id = #{author_id}") }
end
