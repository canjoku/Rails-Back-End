class Types::SubscriberInputType < Types::BaseInputObject
  description "Attribute for creating subscriber"
  argument :id, ID, required: false
  argument :email, String, required: true
end