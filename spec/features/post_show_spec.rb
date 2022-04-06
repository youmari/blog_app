require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  describe 'User' do
    before(:each) do
      picture = 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
      @user1 = User.create! name: 'testname', photo: picture, bio: 'testbio', password: 'testtest',
                            email: 'test1@test.com', confirmed_at: Time.now
      @user2 = User.create! name: 'other user', photo: picture, password: '1234567', email: 'user@gmail.com',
                            confirmed_at: Time.now
      visit 'users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: 'testtest'
      click_on 'Log in'

      @post1 = Post.create!(author: @user1, title: 'test title 1', text: 'test text 1')
      @post2 = Post.create!(author: @user1, title: 'test title 2', text: 'test text 2')
      @post3 = Post.create!(author: @user1, title: 'test title 3', text: 'test text 3')
      @comment1 = @post1.comments.create!(text: 'test comment 1', author_id: @user1.id)
      @like1 = @post1.likes.create!(author_id: @user1.id)
      click_on 'testname'
      click_link 'See all posts'
      click_link 'test title 1'
    end

    it 'can see who wrote the post.' do
      expect(page).to have_content('test title 1 by testname')
    end

    it 'can see the username of each commentor' do
      expect(page).to have_content('testname: test comment 1')
    end

    it 'I can see the post title' do
      expect(page).to have_content('test title 1')
    end

    it 'I can see how many likes it has' do
      expect(page).to have_content('Likes: 0')
    end

    it 'I can see the post body' do
      expect(page).to have_content('test text 1')
    end

    it 'I can see the comment each commentor left' do
      expect(page).to have_content('testname: test comment 1')
    end

    it 'I can see how many comments it has' do
      expect(page).to have_content('Comments: 0')
    end
  end
end
