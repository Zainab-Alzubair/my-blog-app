require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Kim', photo: 'https://picsum.photos/200/300', bio: 'I am a Software Engineer',
                              postsCounter: 2)
    @second_user = User.create(name: 'Sarah', photo: 'https://picsum.photos/200/300', bio: 'I am a teacher',
                               postsCounter: 3)

    visit '/'
  end

  it 'can see the username of all other users.' do
    expect(page).to have_content(@first_user.name)
    expect(page).to have_content(@second_user.name)
  end

  it 'can see the profile picture for each user.' do
    expect(page).to have_css("img[src*='https://picsum.photos/200/300']")
  end

  it 'can see the number of posts each user has written.' do
    expect(page).to have_content(@first_user.postsCounter)
    expect(page).to have_content(@second_user.postsCounter)
  end

  it 'When I click on a user, I am redirected to that users show page.' do
    click_link(@first_user.name)
    expect(page).to have_content(@first_user.name)
    expect(page).to have_content(@first_user.bio)
    expect(page).to have_current_path(user_path(@first_user))
  end
end
