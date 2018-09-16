require 'rails_helper'

RSpec.feature "Posts", type: :feature do

  context "Listing published posts" do
    let!(:post1) {create(:post, :published)}
    let!(:post2) {create(:post, :published)}

    scenario "site users should succesfully list published posts" do

      visit root_path
      find("a[data-menu='logo']").click
      expect(page).to have_content(post1.title)
      expect(page).to have_content(post2.title)
    end
  end

  context "Listing unpublished posts" do
    let!(:post1) {create(:post, :draft)}
    let!(:post2) {create(:post, :draft)}

    scenario "site users should fail to list unpublished posts" do

      visit root_path
      find("a[data-menu='logo']").click

      expect(page).not_to have_content(post1.title)
      expect(page).not_to have_content(post2.title)

    end
  end

  context "Viewing posts" do
    let!(:post) {create(:post, :published)}

    scenario "site users should be able to view published posts" do
      visit root_path
      find("a[data-post='title']").click

      expect(page.current_path).to eq(post_path(post))
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.body)
    end
  end
end