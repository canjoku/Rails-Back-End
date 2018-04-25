require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation tests" do

    let(:user) {build(:random_user)}

    it "ensures the presence of username" do
      user.username = nil
        expect(user.save).to eq(false)
    end

    it "ensures the presence of email" do
      user.email = nil
      expect(user.save).to eq(false)
    end

    it "users should be succesfully saved" do
      expect(user.save).to eq(true)
    end

    it "ensures the presence of a password" do
      user.password = nil
      expect(user.save).to eq(false)
    end
  end
end