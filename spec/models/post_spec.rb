require 'rails_helper'

RSpec.describe Post, type: :model do
  user1 = User.create(name: 'Sarah', photo: 'www.google.com', bio: 'Sarah bio', postsCounter: 0)

  subject do
    Post.new(author: user1, title: 'post title', text: 'post content', likesCounter: 0,
             commentsCounter: 0)
  end

  before { subject.save }

  it 'should have atitle' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'commentsCounter should be a positive integer' do
    subject.commentsCounter = 0
    expect(subject).to be_valid
  end

  it 'likesCounter should be a positive integer' do
    subject.likesCounter = 0
    expect(subject).to be_valid
  end

  it 'commentsCounter is not a negative integer' do
    subject.commentsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'likesCounter is not a negative integer' do
    subject.likesCounter = -1
    expect(subject).to_not be_valid
  end

  it 'title has a maximum length of 250 characters' do
    expect(subject.title.length).to be <= 250
  end
end
