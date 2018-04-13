require "rails_helper"

RSpec.feature "Creating a Blog Post" do
    scenario "A user creates a new blog post" do
        
        visit "/admin/posts/index"

        click_link "New Post"

        fill_in "Title", with: "My first blog post"
        fill_in "Category", with: "Ruby on Rails"
        fill_in "Description", with: "An introduction to Ruby on Rails"
        fill_in "Body", with: "Lorem Ipsum"

        click_button "Create Post"

        expect(page).to have_content("Post has been created")
        expect(page.current_path).to eq(posts_index_path)
    end
end