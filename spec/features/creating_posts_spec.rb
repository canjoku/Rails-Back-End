require "rails_helper"

RSpec.feature "Creating Posts" do
  scenario "A user creates a new post" do

    visit "admin/posts"

    click_link "New post"

    fill_in "Title", with: "#{Faker::Lorem.word}"
    fill_in "Banner image url", with: "#{Faker::Internet.url}"
    fill_in "Description", with: "#{Faker::Lorem.sentence}"
    fill_in "Body", with: "#{Faker::Lorem.paragraph}"

    click_button "Create Post"

    expect(page).to have_content("Post was succesfully created!")
    expect(page.current_path).to eq(admin_posts_path)

  end
end