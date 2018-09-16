require 'rails_helper'

RSpec.describe StackNewPostEmailsJob, type: :job do
  describe "When a post is published" do

    it "enqueues a new post email" do
      StackNewPostEmailsJob.perform_async
      expect(StackNewPostEmailsJob).to have_enqueued_sidekiq_job
    end
  end
end