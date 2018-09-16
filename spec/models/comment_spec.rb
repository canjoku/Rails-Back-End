require 'rails_helper'

RSpec.describe Comment, type: :model do

  context "Triggering the publish_creation callback" do
    let!(:comment) {build(:comment)}

    it "should broadcast the send_comment_mail_function when a comment is created" do
      comment.save
      expect { comment.save }.to broadcast(:send_comment_mail, comment.id)
    end
  end
end