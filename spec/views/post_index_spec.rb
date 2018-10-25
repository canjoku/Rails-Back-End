require 'rails_helper'

RSpec.describe 'posts/index.html.erb' do
  context "Rendering index page with 2 posts" do

    let!(:post1) {create(:post, :published)}
    let!(:post2) {create(:post, :published)}

    before do
      assign(:posts, [post1, post2])
      render
    end

    it 'should display the titles of both posts' do
      expect(rendered).to include(post1.title)
      expect(rendered).to include(post2.title)
    end
  end
end



