require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET /users/:user_id/posts' do
    before(:each) do
      get '/users/1/posts'
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns all posts to @posts' do
      expect(assigns(:posts)).to eq(Post.all)
    end

    it 'should render index template' do
      expect(response).to render_template(index)
    end

    it 'should includes the correct placeholder in the body' do
      expect(response.body).to include 'Here is the posts page for a given user'
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    before(:each) do
      get 'users/1/posts/1'
    end

    it 'should render show template' do
      expect(response).to render_template(show)
    end
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'should includes the correct placeholder in the body' do
      expect(response.body).to include 'Here is the post page for a given user'
    end
  end
end
