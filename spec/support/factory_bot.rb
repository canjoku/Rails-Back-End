RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

include ActionDispatch::TestProcess

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    slug { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
    avatar { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test-image.png'), 'image/png')}

    trait :published do
      status { "published" }
    end

    trait :draft do
      status { "draft" }
    end

    factory :post_with_comments do
      after(:create) do |post|
        create(:comment, post: post)
      end
    end
  end

  factory :comment do
    body { Faker::Lorem.sentence }
    name { Faker::Name.first_name }
    picture { Faker::Internet.url }
    post
  end

  FactoryBot.define do
    factory :subscriber do
      email { Faker::Internet.email }
    end
  end
end