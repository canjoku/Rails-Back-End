require 'rails_helper'

RSpec.describe Types::CommentType, type: :request do

  describe "creating a comment" do
    let!(:post) { create(:post) }
    let!(:query) do %|
      mutation{
        createComment(comment: { postSlug: "#{post.slug}", name: "tony", body: "Awesome post. Thank you", picture: "path to picture" }){
          id
          body
          name
          picture
          post {
            id
            title
            body
          }
        }
      }|
    end

    let!(:result) do
      MyBlogSchema.execute(query, context: {
        authorised: true
      })
    end

    it "should return the associated post" do
      result_hash = result.to_h.fetch("data").fetch("createComment")
      expect(result_hash.fetch("post").fetch("id")).to eq("#{post.id}")
      expect(result_hash.fetch("post").fetch("title")).to eq("#{post.title}")
      expect(result_hash.fetch("post").fetch("body")).to eq("#{post.body}")
    end

    it "should return an associated comment id if it has been saved" do
      result_hash = result.to_h.fetch("data").fetch("createComment")
      expect(result_hash.fetch("id")).to_not eq(nil)
    end
  end

end