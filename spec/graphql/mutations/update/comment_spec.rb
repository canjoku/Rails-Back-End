require 'rails_helper'

RSpec.describe Types::CommentType, type: :request do

  describe "updating a comment" do
    let!(:comment) { create(:comment) }
    let!(:query) do %|
      mutation {
        updateComment(comment: { id: #{comment.id}, body: "Awesome post, thanks for sharing", postId: "#{comment.post.id}" })
      }|
    end

    let!(:result) do
      MyBlogSchema.execute(query)
    end

    it 'should return true if comment has been succesfully updated' do
      result_hash = result.to_h.fetch("data")
      expect(result_hash.fetch("updateComment")).to eq(true)
    end
  end

end