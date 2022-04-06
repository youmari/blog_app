require 'rails_helper'

RSpec.describe 'the signin process', type: :feature do
  describe 'login page' do
    before(:each) do
      picture = 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
      @user1 = User.create! name: 'test', photo: picture, password: 'testtest',
                            email: 'test1@test.com', posts_counter: 0, confirmed_at: Time.now
      @user2 = User.create! name: 'other user', photo: picture, password: '1234567', email: 'user@gmail.com',
                            confirmed_at: Time.now
      visit 'users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: 'testtest'
      click_on 'Log in'
    end
    it "should have all users's name" do
      visit 'users'
      expect(page).to have_content 'test'
      expect(page).to have_content 'other user'
    end

    it "should have all users's name" do
      visit 'users'
      expect(page).to have_content 'test'
      expect(page).to have_content 'other user'
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(2)
    end

    it 'should see number of posts' do
      expect(page).to have_content 'Number of posts: 0'
    end

    it 'should go to user profile when click on user name' do
      click_on 'test'
      expect(page).to have_content 'test'
      expect(page).to have_content 'Bio'
    end

    # it "should click to  log in button and got an error" do
    #   visit 'users/sign_in'
    #   click_on 'Log in'
    #   expect(page).to have_content  "Invalid Email or password."
    # end

    # it "should got an error" do
    #   visit 'users/sign_in'

    #   fill_in 'Email', with: 'example@gmail.com'
    #   fill_in 'Password', with: 'password'

    #   click_on 'Log in'

    #   expect(page).to have_content  "Invalid Email or password."
    # end

    # it "should log in succesfully" do
    #   visit 'users/sign_in'
    #   fill_in 'Email', with: 'test@test.com'
    #   fill_in 'Password', with: 'yassine'
    #   click_on 'Log in'

    #   expect(current_path).to have_content('/users')
    # end
  end
end
