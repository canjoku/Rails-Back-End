require "rails_helper"

RSpec.describe Category, type: :model do
    before(:all) do
    @category = Category.new(name: "procoders")
    end

    it "should have a matching name" do
        expect(@category.name).to eq("procoders")
    end
end
