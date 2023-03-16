require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET /users' do
    before(:each) do
      get users_path
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns all users to @users' do
      expect(assigns(:users)).to eq(User.all)
    end

    it 'should render index template' do
      expect(response).to render_template(index)
    end

    it 'should includes the correct placeholder in the body' do
      expect(response.body).to include 'Here is a list of users'
    end
  end

  describe 'GET /users /id' do
    before(:each) do
      get '/users/1'
    end

    it 'should render show template' do
      expect(response).to render_template(show)
    end
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'should includes the correct placeholder in the body' do
      expect(response.body).to include 'Here is the profile page for a given user'
    end
  end
end
