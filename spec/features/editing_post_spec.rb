require "rails_helper"

RSpec.feature "Editing a blog post" do
    scenario "A user edits a post" do
        
        visit "/admin/posts/index"

        click_link "Edit Post"

        fill_in "Title", with: "My first blog post"
        fill_in "Category", with: "Ruby on Rails"
        fill_in "Description", with: "An introduction to Ruby on Rails"
        fill_in "Body", with: "Lorem Ipsum"

        click_button "Save Post"

        expect(page).to has_content("Post has been succesfully updated")
        expect(page.current_path).to eq(posts_index_path)
    end
end