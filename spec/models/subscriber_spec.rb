require 'rails_helper'

RSpec.describe Subscriber, type: :model do

  context "Triggering the publish_creation callback" do
    let!(:subscriber) {build(:subscriber)}

    it "should broadcast the send_welcome_mail_function when a new subscription email is captured" do
      expect { subscriber.save }.to broadcast(:send_welcome_mail, subscriber.email)
    end
  end
end