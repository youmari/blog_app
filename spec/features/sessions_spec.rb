require 'rails_helper'

RSpec.describe 'the signin process', type: :feature do
  before :each do
    User.create(name: 'test', email: 'test@test.com', password: 'test')
  end
  describe 'login page' do
    it 'should navigate to log in page' do
      visit 'users/sign_in'
      expect(page).to have_content 'Email'
      expect(page).to have_content 'Password'
      expect(page).to have_button('Log in')
    end

    it 'should click to  log in button and got an error' do
      visit 'users/sign_in'
      click_on 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'should got an error' do
      visit 'users/sign_in'

      fill_in 'Email', with: 'example@gmail.com'
      fill_in 'Password', with: 'password'

      click_on 'Log in'

      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'should log in succesfully' do
      visit 'users/sign_in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'yassine'
      click_on 'Log in'

      expect(current_path).to have_content('/users')
    end
  end
end
