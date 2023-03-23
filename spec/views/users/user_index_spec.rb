require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Kim', photo: 'https://picsum.photos/200/300', bio: 'I am a Software Engineer')
    @first_post = Post.create(author_id: @first_user.id, title: 'My first post', text: 'This is my first post')
    @second_post = Post.create(author_id: @first_user.id, title: 'My second post', text: 'This is my second post')
    # secod user
    @second_user = User.create(name: 'Sarah', photo: 'https://picsum.photos/200/300', bio: 'I am a teacher')
    @second_user_first_post = Post.create(author_id: @second_user.id, title: 'My first post',
                                          text: 'This is my first post')

    visit users_path
  end

  it 'can see the username of all other users.' do
    expect(page).to have_content('Kim')
    expect(page).to have_content('Sarah')
  end

  it 'can see the profile picture for each user.' do
    expect(page).to have_css("img[src*='https://picsum.photos/200/300']")
    expect(page).to have_css("img[src*='https://picsum.photos/200/300']")
  end

  it 'can see the number of posts each user has written.' do
    expect(page).to have_content('2')
    expect(page).to have_content('1')
  end

  it 'When I click on a user, I am redirected to that users show page.' do
    click_link(@first_user.name)
    expect(page).to have_content(@first_user.name)
    expect(page).to have_content(@first_user.bio)
    expect(page).to have_current_path(user_path(@first_user.id))
  end
end
