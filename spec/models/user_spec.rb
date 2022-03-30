require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'john', posts_counter: 0) }
  before(:each) { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    expect(subject).to be_valid
  end

  it 'posts_counter must be not <= 0 failure' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end
  it 'posts_counter must be not <= 0 success' do
    expect(subject).to be_valid
  end

  context "Test User'methods" do
    it 'should return three recent posts from the user' do
      expect(User.three_recent_posts(subject).count).to be(0)
    end
  end
end
