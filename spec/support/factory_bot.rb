RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do

    factory :random_user, class: User do
        username { Faker::Name.name}
        email { Faker::Internet.safe_email}
        password {Faker::Internet.password}
    end

    factory :random_post, class: Post do
        title {Faker::Lorem.word}
        description {Faker::Lorem.sentence}
        banner_image_url {Faker::Internet.url}
        body {Faker::Lorem.paragraphs}
        user_id {Faker::Number.digit}
    end
end