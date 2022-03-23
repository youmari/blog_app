require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do 
    before(:each) { get users_path }
    it "should match ok status" do
      expect(response).to have_http_status(:ok)
    end
    it "should the body has h1 text" do
      expect(response.body).to include('Here is a list of users')
    end
    it "should render index template" do
      expect(response).to render_template(:index)
    end
  end
  describe "GET /show" do 
    before(:each) { get user_path(1) }
    it "should match ok status" do
      expect(response).to have_http_status(:ok)
    end
    it "should the body has h1 text" do
      expect(response.body).to include('Here is a list of a specific user')
    end
    it "should render index template" do
      expect(response).to render_template(:show)
    end
  end
end
