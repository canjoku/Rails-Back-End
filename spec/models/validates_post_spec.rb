require "rails_helper"

RSpec.describe Post, type: :model do
    before(:all) do
    @post = Post.new(user_id:10, title: "my first blog post", description: "Lorem Ipsum", body: "Learning Ruby on Rails")
    end

    it "should have a matching title" do
        expect(@post.title).to eq("my first blog post")
    end

    it "should have a matching body" do
        expect(@post.body).to eq("Learning Ruby on Rails")
    end
end
