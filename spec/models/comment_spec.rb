require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'john', photo: 'www.google.com', bio: 'devs', postsCounter: 0)
  post = Post.create(author: user, title: 'author title', text: 'post content', likesCounter: 0,
                     commentsCounter: 0)

  subject do
    Comment.new(author: user, post:, text: 'sample comment')
  end

  before { subject.save }

  it 'has post' do
    expect(subject.post).to eq(post)
  end

  it 'has User' do
    expect(subject.author).to eq(user)
  end

  it 'should update comments counter' do
    expect { subject.update_comments_counter }.to change { post.commentsCounter }.by(1)
  end
end
