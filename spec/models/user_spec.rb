require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Sarah', photo: 'www.google.com', bio: 'I am a developer', postsCounter: 0) }

  before { subject.save }

  it 'should increment the postsCounter' do
    expect { subject.increment!(:postsCounter) }.to change { subject.postsCounter }.by(1)
  end

  it 'should return the recent posts' do
    Post.create(author: subject, title: 'Hello', text: 'Hello World', commentsCounter: 0, likesCounter: 0)
    posts = subject.recent_posts
    expect(posts.length).to eq(1)
  end

  it 'cannot add user without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postsCounter should be a positive integer' do
    subject.postsCounter = 0
    expect(subject).to be_valid
  end

  it 'postsCounter is not a negative integer' do
    subject.postsCounter = -1
    expect(subject).to_not be_valid
  end
end
