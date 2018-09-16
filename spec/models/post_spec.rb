require 'rails_helper'

RSpec.describe Post, type: :model do
  context "Returning posts" do

    let!(:post1) {create(:post, :published)}
    let!(:post2) {create(:post, :published)}
    let!(:post3) {create(:post, :draft)}
    let!(:post4) {create(:post, :draft)}

    it "should return posts that are marked as published" do
      published_posts = Post.published

      expect(published_posts).to eq([post1, post2])
      expect(published_posts).to_not eq([post3, post4])

      draft_posts = Post.draft

      expect(draft_posts).to eq([post3, post4])
      expect(draft_posts).to_not eq([post1, post2])
    end
  end

  context "Returning posts that have comments" do

    let!(:published_post) {create(:post_with_comments, :published)}
    let!(:draft_post) {create(:post_with_comments, :draft)}

    it "should return posts that have comments" do
      published = Post.includes(:comments).friendly.find(published_post[:id])
      draft = Post.includes(:comments).friendly.find(draft_post[:id])

      expect(published.comments).to eq(published_post.comments)
      expect(draft.comments).to eq(draft_post.comments)
    end
  end

  context "Triggering the publish_creation callback" do
    let!(:draft_post) {create(:post_with_comments, :draft)}

    it "should broadcast the send_new_mail_function when post status is changed to 'published'" do
      post = draft_post
      post.status = "publish"
      post.save

      expect { post.save }.to broadcast(:send_new_post_mail, post.id)
    end
  end
end