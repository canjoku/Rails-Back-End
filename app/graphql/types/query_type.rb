class Types::QueryType < Types::BaseObject

  def post(slug:)
    Post.friendly.find(slug)
  end

  field :post, Types::PostType, null: true do
    description "Returns a post with slug given"
    argument :slug, String, required: true
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
