class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  ROLES = %i[admin default].freeze

  scope :three_recent_posts, ->(user) { user.posts.order(id: :DESC).limit(3) }

  def is?(requested_role)
    role == requested_role.to_s
  end
end
