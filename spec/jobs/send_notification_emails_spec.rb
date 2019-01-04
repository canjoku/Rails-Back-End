require 'rails_helper'

RSpec.describe SendNotificationEmailsJob, type: :job do
  describe "When a post is published" do

    it "enqueues a notification email to all subscribers" do
      SendNotificationEmailsJob.perform_async
      expect(SendNotificationEmailsJob).to have_enqueued_sidekiq_job
    end
  end
end