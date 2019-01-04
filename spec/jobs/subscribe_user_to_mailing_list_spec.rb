require 'rails_helper'

RSpec.describe SubscribeUserToMailingListJob, type: :job do
  describe "When a new user subscribes to receive emails" do
    email = Faker::Internet.safe_email

    it "enqueues a request to add the user to a mailchimp list" do
      SubscribeUserToMailingListJob.perform_async(email)
      expect(SubscribeUserToMailingListJob).to have_enqueued_sidekiq_job(email)
    end
  end
end
