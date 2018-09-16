require 'rails_helper'

RSpec.describe Types::CommentType, type: :request do

  describe "deleting a comment" do
    let!(:comment) { create(:comment) }
    let!(:query) do %|
      mutation {
        deleteComment(id: "#{comment.id}")
      }|
    end

    let!(:result) do
      MyBlogSchema.execute(query)
    end

    it 'should return true if comment has been succesfully deleted' do
      result_hash = result.to_h.fetch("data")
      expect(result_hash.fetch("deleteComment")).to eq(true)
    end
  end

end