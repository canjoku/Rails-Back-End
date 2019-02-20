class Types::CommentInputType < Types::BaseInputObject

  description "Attributes for creating and updating a comment"

  argument :id, ID, required: false
  argument :body, String, required: true
  argument :name, String, required: true
  argument :picture, String, required: true
  argument :post_slug, String, required: true
end