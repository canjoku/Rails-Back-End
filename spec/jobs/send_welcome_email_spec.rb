require 'rails_helper'

RSpec.describe SendWelcomeEmailJob, type: :job do
  describe "When a new user subscribes to receive emails" do
    email = Faker::Internet.safe_email

    it "enqueues a welcome email" do
      SendWelcomeEmailJob.perform_async(email)
      expect(SendWelcomeEmailJob).to have_enqueued_sidekiq_job(email)
    end
  end
end
