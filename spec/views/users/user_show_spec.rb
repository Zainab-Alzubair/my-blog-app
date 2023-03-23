require 'rails_helper'

RSpec.describe 'users#show', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Kim', photo: 'https://picsum.photos/200/300', bio: 'I am a Software Engineer')
    @first_post = Post.create(author_id: @user.id, title: 'My first post', text: 'This is my first post')
    @second_post = Post.create(author_id: @user.id, title: 'My second post', text: 'This is my second post')
    # secod user
    @second_user = User.create(name: 'Sarah', photo: 'https://picsum.photos/200/300', bio: 'I am a teacher')
    @second_user_first_post = Post.create(author_id: @user.id, title: 'My first post', text: 'This is my first post')

    visit user_path(@user.id)
  end
  it 'can see the user profile picture' do
    expect(page).to have_css("img[src*='https://picsum.photos/200/300']")
  end

  it 'can see the user username' do
    expect(page).to have_content('Kim')
  end

  it 'can see the number of posts the user has written.' do
    expect(page).to have_content('2')
  end

  it 'can see the user bio.' do
    expect(page).to have_content('I am a Software Engineer')
  end

  it 'can see the user first 3 posts' do
    posts = @user.posts.order(created_at: :desc).limit(3)
    posts.each do |post|
      expect(page).to have_content(post.text)
    end
  end

  it 'can see a button that lets me view all of a user posts.' do
    expect(page).to have_link('See all posts')
  end

  it 'When I click to see all posts, it redirects me to the user posts index page' do
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user.id))
  end
end
