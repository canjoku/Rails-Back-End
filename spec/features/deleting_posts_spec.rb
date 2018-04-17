require "rails_helper"

RSpec.feature "Deleting Posts" do
  scenario "A deletes a post" do

    visit "admin/posts/index"

    click_link "Delete Post"

    expect(page.current_path).to eq(admin_posts_path)

  end
end