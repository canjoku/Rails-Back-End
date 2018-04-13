class Comment < ApplicationRecord
    belongs_to :posts

    validates :body, presence: true
end

