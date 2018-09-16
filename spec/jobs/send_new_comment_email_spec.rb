require 'rails_helper'

RSpec.describe SendNewCommentEmailJob, type: :job do
  describe "When a user adds new comment" do

    it "enqueues a new comment email notification" do
      SendNewCommentEmailJob.perform_async
      expect(SendNewCommentEmailJob).to have_enqueued_sidekiq_job
    end
  end
end
