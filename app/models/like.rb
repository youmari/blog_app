class Like < ApplicationRecord
  belongs_to :authorId
  belongs_to :postId
end
