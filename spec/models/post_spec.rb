require 'rails_helper'

RSpec.describe Post, type: :model do
    context "validation tests" do

        let(:post) {build(:random_post)}

        it "ensures the presence of title" do
            post.title = nil
            expect(post.save).to eq(false)
        end

        it "ensures the presence of description" do
            post.description = nil
            expect(post.save).to eq(false)
        end

        it "ensures the presence of body" do
            post.body = nil
            expect(post.save).to eq(false)
        end

        it "posts should be succesfully saved" do
            expect(post.save).to eq(true)
        end
    end
end