require "rails_helper"

RSpec.feature "Viewing a Blog Post" do
    scenario "A visitor views a blog post" do
        
        visit "/"

        click_link "View Post"

        expect(page).to has_content("Lorem Ipsum")
        expect(page.current_path).to eq(posts_show_path)
    end
end