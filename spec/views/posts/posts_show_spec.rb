require 'rails_helper'

RSpec.describe 'posts#show', type: :feature do
  before(:each) do
    @user = User.create(name: 'Kim', photo: 'https://picsum.photos/200/300', bio: 'I am a Software Engineer')
    @first_post = Post.create(author_id: @user.id, title: 'My first post', text: 'This is my first post')
    @second_post = Post.create(author_id: @user.id, title: 'My second post', text: 'This is my second post')
    # secod user
    @second_user = User.create(name: 'Sarah', photo: 'https://picsum.photos/200/300', bio: 'I am a teacher')
    @second_user_first_post = Post.create(author_id: @second_user.id, title: 'My first post',
                                          text: 'This is my first post')

    Comment.create(author_id: @user.id, post_id: @first_post.id, text: 'This is my first comment')

    visit user_post_path(@user.id, @first_post.id)
  end

  it 'can see the post title' do
    expect(page).to have_content('This is my first post')
  end

  it 'can see who wrote the post.' do
    expect(page).to have_content('Kim')
  end

  it 'can see how many comments it has.' do
    expect(page).to have_content('1')
  end

  it 'can see how many likes it has.' do
    expect(page).to have_content('0')
  end

  it ' can see the post body.' do
    expect(page).to have_content('This is my first post')
  end

  it 'can see the username of each commentor' do
    expect(page).to have_content('Kim')
  end

  it 'can see the comment each commentor left' do
    expect(page).to have_content('This is my first comment')
  end
end
