require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Tom', posts_counter: 0)
  post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                     comments_counter: 0)
  subject { Like.create(author_id: user.id, post_id: post.id) }
  before(:each) { subject.save }

  it 'name should be present' do
    Like.update_likes_counter(post)
    expect(post.likes_counter).to be(1)
  end
end
