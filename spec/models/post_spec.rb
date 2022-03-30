require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Tom', posts_counter: 0)
  subject do
    Post.new(author_id: user.id, title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
  end

  before(:each) { subject.save }

  it 'check if the title is not blank' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'likes_counter must be not <= 0 failure' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end
  it 'likes_counter must be not <= 0 success' do
    expect(subject).to be_valid
  end

  it 'comments_counter must be not <= 0 failure' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end
  it 'comments_counter must be not <= 0 success' do
    expect(subject).to be_valid
  end

  it 'return the recent comments for a post' do
    expect(Post.five_recent_comments(subject).count).to eql 0
  end

  it 'return the recent comments for a post' do
    expect(Post.update_user_posts_counter(user)).to eql true
  end

  it 'return all the comments for a post' do
    expect(Post.all_posts_for_a_user(subject.id).count).to eql 0
  end
end
