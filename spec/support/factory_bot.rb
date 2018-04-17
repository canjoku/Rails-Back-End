RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do

    factory :random_user, class: User do
        username { Faker::Name.name}
        email { Faker::Internet.safe_email}
    end

    factory :random_post, class: Post do
        title {Faker::Lorem.word}
        description {Faker::Lorem.sentence}
        body {Faker::Lorem.paragraphs}
        user_id {Faker::Number.digit}
    end
end