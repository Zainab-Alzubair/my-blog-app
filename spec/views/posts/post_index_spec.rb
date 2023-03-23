require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Kim', photo: 'https://picsum.photos/200/300', bio: 'I am a Software Engineer')
    @first_post = Post.create(author_id: @first_user.id, title: 'My first post', text: 'This is my first post')
    @second_post = Post.create(author_id: @first_user.id, title: 'My second post', text: 'This is my second post')
    # secod user
    @second_user = User.create(name: 'Sarah', photo: 'https://picsum.photos/200/300', bio: 'I am a teacher')
    @second_user_first_post = Post.create(author_id: @second_user.id, title: 'My first post', text: 'This is my first post')

    Comment.create(author_id: @second_user.id, post_id: @second_user_first_post.id, text: 'This is my first comment')

    visit user_posts_path(@user.id)
  end

  it 'can see the user profile picture.' do
    expect(page).to have_css("img[src*='https://picsum.photos/200/300']")
  end

  it 'I can see the user username' do
    expect(page).to have_content('Kim')
  end

  it 'can see the number of posts the user has written' do
    expect(page).to have_content('2')
  end

  it 'I can see a post title' do
    expect(page).to have_content('This is my first post')
    expect(page).to have_content('This is my second post')
  end

  it 'can see some of the post body' do
    expect(page).to have_content('This is my first post')
    expect(page).to have_content('This is my second post')
  end

  it 'can see how many comments a post has' do
    expect(page).to have_content('1')
  end

  it 'can see how many likes a post has.' do
    expect(page).to have_content('0')
  end
  it 'can see a button to create a new post' do
    expect(page).to have_link('Create new post')
  end


  it 'When I click on a post, it redirects me to that post show page.' do
    click_link 'This is my second post'
    expect(page).to have_current_path(user_post_path(@user.id, @post_second.id))
  end
end