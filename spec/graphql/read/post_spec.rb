require 'rails_helper'

RSpec.describe Types::PostType, type: :request do

  describe "retrieving a single post" do
    let!(:post) { create(:post) }
    let!(:query) do %|
      {
        post(id: #{post.id}) {
          id
          title
          body
        }
      }|
    end

    let!(:result) do
      MyBlogSchema.execute(query)
    end

    it 'should return the post' do
      result_hash = result.to_h.fetch("data").fetch("post")
      expect(result_hash.fetch("id")).to eq("#{post.id}")
      expect(result_hash.fetch("title")).to eq("#{post.title}")
      expect(result_hash.fetch("body")).to eq("#{post.body}")
    end
  end

  describe "retrieving a collection of posts" do
    let!(:post1) {create(:post, :published)}
    let!(:post2) {create(:post, :published)}
    let!(:post3) {create(:post, :published)}
    let!(:post4) {create(:post, :published)}
    let!(:query) do %|
      {
        posts{
          title
        }
      }|
    end

    let!(:result) do
      MyBlogSchema.execute(query)
    end

    it 'should return an array of the titles of all posts ' do
      result_hash = result.to_h.fetch("data").fetch("posts")
      result_titles_array = result_hash.map { |x| x.values[0] }
      posts_titles_array = [post1.title, post2.title, post3.title, post4.title]

      expect(result_titles_array).to eq(posts_titles_array)
    end
  end
end
