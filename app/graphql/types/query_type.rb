class Types::QueryType < Types::BaseObject
  field :post, Types::PostType, null: true do
    description "Returns a post with id given"
    argument :id, ID, required: true
  end

  def post(id:)
    Post.find(id)
  end

  field :posts, [Types::PostType], null: false do
    description "Returns an array of all posts"
  end

  def posts
    Post.all.includes(:comments)
  end

  field :subscriber, Types::SubscriberType, null: true do
    description "Returns a subscriber's with id given"
    argument :id, ID, required: true
  end

  def subscriber(id:)
    Subscriber.find(id)
  end

end
