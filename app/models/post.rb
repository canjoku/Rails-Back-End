class Post < ApplicationRecord

    belongs_to :categories
    belongs_to :users
    has_many :comments

    validates :title, presence: true
    validates :description, presence: true
    validates :body, presence: true
    validates :user_id, presence: true
end
