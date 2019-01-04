require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  include AdminSpecHelper

  context "Creating posts" do

    scenario "Admin user succesfully creates a new post" do
      admin_login
      visit admin_root_path

      click_link('Create Post')
      title = Faker::Lorem.word
      fill_in("post[title]", with: title)
      fill_in("post[body]", with: Faker::Lorem.paragraph)
      attach_file "post[avatar]", "#{Rails.root}/spec/fixtures/files/test-image.png"
      click_button('Create Post')

      expect(page).to have_content("Post #{title} was succesfully created!")
    end

    scenario "Admin user fails to create a new post when a required form field is'nt filled in" do
      admin_login
      visit admin_root_path

      click_link('Create Post')
      click_button('Create Post')

      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Body can't be blank")
    end
  end

  context "Listing all posts" do
    let!(:post1) {create(:post, :published)}
    let!(:post2) {create(:post, :published)}
    let!(:post3) {create(:post, :draft)}
    let!(:post4) {create(:post, :draft)}

    scenario "admin user should succesfully list both used and published posts", js: true do
      admin_login
      visit admin_root_path

      expect(page).to have_content(post3.title)
      expect(page).to have_content(post1.title)
      expect(page).to have_content(post2.title)
      expect(page).to have_content(post4.title)
    end
  end

  context "Editing published posts" do
    let!(:post) {create(:post, :published)}

    scenario "Admin user succesfully edits a published post" do
      admin_login
      visit admin_root_path
      edit_post
    end
  end

  context "Editing draft posts" do
    let!(:post) {create(:post, :draft)}

    scenario "Admin user succesfully edits a draft post" do
      admin_login
      visit admin_root_path
      edit_post
    end
  end

  context "Deleting posts", js: true do
    let!(:post) {create(:post, :draft)}

    scenario "Admin user succesfully deletes a post" do
      admin_login
      visit admin_root_path

      find("[data-behavior='delete']").click
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content("Post was succesfully destroyed!")
    end
  end

end