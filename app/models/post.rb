class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  scope :update_user_posts_counter, ->(user) { user.update(posts_counter: user.posts.count) }

  scope :five_recent_comments, ->(post) { Comment.all.where("post_id = #{post.id}").order(id: :DESC).limit(5) }
end
