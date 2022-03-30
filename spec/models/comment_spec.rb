require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Tom', posts_counter: 0)
  post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                     comments_counter: 0)
  subject { Comment.create(author_id: user.id, post_id: post.id, text: 'comment') }
  before(:each) { subject.save }

  it 'name should be present' do
    Comment.update_comments_counter(post)
    expect(post.comments_counter).to be(1)
  end
end
