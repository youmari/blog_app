class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  scope :update_comments_counter, lambda { |post|
                                    post.update(comments_counter: Comment.all.where("post_id = #{post.id}").count)
                                  }
end
