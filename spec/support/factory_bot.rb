RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }

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
    post
  end

  FactoryBot.define do
    factory :subscriber do
      email { Faker::Internet.email }
    end
  end
end