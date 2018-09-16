require 'rails_helper'

RSpec.describe Types::SubscriberType, type: :request do

  describe "creating a subscriber" do
    let!(:subscriber) { build(:subscriber) }
    let!(:query) do %|
      mutation {
        createSubscriber(subscriber: { email: "#{subscriber.email}" }) {
          email
          id
        }
      }|
    end

    let!(:result) do
      MyBlogSchema.execute(query)
    end

    it 'should return the subscribers email address' do
      result_hash = result.to_h.fetch("data").fetch("createSubscriber")
      expect(result_hash.fetch("email")).to eq("#{subscriber.email}")
    end

    it "should return an associated subscriber id if it has been saved" do
      result_hash = result.to_h.fetch("data").fetch("createSubscriber")
      expect(result_hash.fetch("id")).to_not eq(nil)
    end
  end

end
