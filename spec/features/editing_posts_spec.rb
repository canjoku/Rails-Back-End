require "rails_helper"

RSpec.feature "Creating Posts" do
    scenario "A user creates a new post" do

        visit "admin/posts/index"

        click_link "Edit Post"

        fill_in "Title", with: "Creating a blog"
        fill_in "Description", with: "Creating a new description"
        fill_in "Body", with: "Creating the body for my post"

        click_button "Save Post"

        expect(page).to have_content("Post has been succesfully updated")
        expect(page.current_path).to eq(admin_posts_path)

    end
end