class Types::CommentInputType < Types::BaseInputObject
  description "Attributes for creating and updating a comment"
  argument :id, ID, required: false
  argument :body, String, required: true
  argument :post_id, ID, required: true
end