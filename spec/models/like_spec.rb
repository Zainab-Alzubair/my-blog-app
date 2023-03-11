require 'rails_helper'

RSpec.describe Like, type: :model do
  user1 = User.create(name: 'Sarah', photo: 'www.google.com', bio: 'Sarah bio', postsCounter: 0)
  post1 = Post.create(author: user1, title: 'post1 title', text: 'post1 content', likesCounter: 0,
                      commentsCounter: 0)

  subject do
    Like.new(author: user1, post: post1)
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'likes counter should be incremented by 1' do
    expect { subject.update_likes_counter }.to change { post1.likesCounter }.by(1)
  end
end
