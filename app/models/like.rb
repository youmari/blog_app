class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  scope :update_likes_counter, ->(post) { post.update(likes_counter: Like.all.where("post_id = #{post.id}").count) }
end
