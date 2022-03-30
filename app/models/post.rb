class Post < ApplicationRecord
  validates :title, :text, presence: true
  validates :title, length: { in: 0..250 }
  validates :comments_counter, :likes_counter, comparison: { greater_than_or_equal_to: 0 }
  belongs_to :author, class_name: 'User'

  scope :update_user_posts_counter, ->(user) { user.update(posts_counter: user.posts.count) }

  scope :five_recent_comments, lambda { |post|
                                 Comment.all.where("post_id = #{post.id}").order(id: :DESC).includes(:post).limit(5)
                               }

  scope :all_posts_for_a_user, ->(author_id) { Post.all.includes(:author).where("author_id = #{author_id}") }
end
