require "rails_helper"

RSpec.describe Comment, type: :model do
    before(:all) do
    @comment = Comment.new(body: "Having fun with rails")
    end

    it "should have a matching body" do
        expect(@comment.body).to eq("Having fun with rails")
    end

end
