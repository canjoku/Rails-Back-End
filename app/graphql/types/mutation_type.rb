class Types::MutationType < Types::BaseObject

  field :create_comment, Types::CommentType, null: true, description: "Creates a comment" do
    argument :comment, Types::CommentInputType, required: true
  end

  def create_comment(comment:)
    if context.fetch(:authorised)
      post = Post.friendly.find(comment.post_slug)
      post.comments.create(name: comment.name, body: comment.body, picture: comment.picture)
    else
      GraphQL::ExecutionError.new("please login")
    end
  end

  field :create_subscriber, Types::SubscriberType, null: true, description: "Creates a subscriber" do
    argument :subscriber, Types::SubscriberInputType, required: true
  end

  def create_subscriber(subscriber:)
    Subscriber.create subscriber.to_h
  end

  field :update_comment, Boolean, null: false, description: "Updates an existing comment" do
    argument :comment, Types::CommentInputType, required: true
  end

  def update_comment(comment:)
    existing_comment = Comment.find(comment[:id])
    existing_comment&.update(name: comment.name, body: comment.body)
  end

  field :delete_comment, Boolean, null: true, description: "Deletes an existing comment" do
    argument :id, ID, required: true
  end

  def delete_comment(id:)
    Comment.find(id).destroy
  end

end
