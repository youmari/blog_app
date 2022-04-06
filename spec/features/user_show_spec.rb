require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
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
      click_on 'testname'
    end

    it 'shows the username of the user' do
      expect(page).to have_content('testname')
    end

    it 'shows the photo for ther user' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it 'shows number of posts for the user' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'shows the bio for the user' do
      expect(page).to have_content('testbio')
    end

    it 'Should see the first 3 posts for the user.' do
      expect(page).to have_content 'test title 1'
      expect(page).to have_content 'test title 2'
      expect(page).to have_content 'test title 3'
    end

    it 'Can see a button that lets me view all of a users posts' do
      expect(page).to have_link 'See all posts'
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s show page.' do
      click_link 'See all posts'
      expect(page).to have_content 'New Post'
    end
  end
end
