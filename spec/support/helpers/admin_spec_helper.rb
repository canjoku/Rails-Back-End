module AdminSpecHelper
  def admin_login
    name = ENV['ADMIN_USER']
    password = ENV['ADMIN_PASSWORD']

    if page.driver.respond_to?(:basic_auth)
      page.driver.basic_auth(name, password)
    elsif page.driver.respond_to?(:basic_authorize)
      page.driver.basic_authorize(name, password)
    elsif page.driver.respond_to?(:browser) && page.driver.browser.respond_to?(:basic_authorize)
      page.driver.browser.basic_authorize(name, password)
    else
      visit "http://admin:password@#{ Capybara.current_session.server.host }:#{ Capybara.current_session.server.port }/admin"
    end
  end

  def edit_post
    find("[data-behavior='edit']").click
    test_title = Faker::Lorem.word
    fill_in "title", with: test_title
    find("input[data-field='create-post']").click

    expect(page).to have_content("Post was succesfully updated!")
    expect(page).to have_content(test_title)
    expect(page).to have_content(post.status)
  end
end