require "rails_helper"

RSpec.describe User, type: :model do
    before(:all) do
    @user = User.new(name: "Tony", email: "chidi@procoders.com")
    end

    it "should have a matching email" do
        expect(@user.email).to eq("chidi@procoders.com")
    end

    it "should have a matching body" do
        expect(@user.name).to eq("Tony")
    end
end