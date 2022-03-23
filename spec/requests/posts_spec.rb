require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) { get user_posts_path(1) }
    it 'should match ok status' do
      expect(response).to have_http_status(:ok)
    end
    it 'should the body has h1 text' do
      expect(response.body).to include('Here is a list of posts for given specific user')
    end
    it 'should render index template' do
      expect(response).to render_template(:index)
    end
  end
  describe 'GET /show' do
    before(:each) { get user_post_path(1, 3) }
    it 'should match ok status' do
      expect(response).to have_http_status(:ok)
    end
    it 'should the body has h1 text' do
      expect(response.body).to include('Here is a list of post for given specific user')
    end
    it 'should render index template' do
      expect(response).to render_template(:show)
    end
  end
end
