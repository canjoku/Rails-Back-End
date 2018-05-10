require "rails_helper"

RSpec.feature "Deleting Posts" do
  scenario "A user deletes a post" do

    visit "admin/posts"

    click_link "Remove"

    expect(page).to have_content("Post was succesfully deleted!")
    expect(page.current_path).to eq(admin_posts_path)

  end
end