class Types::SubscriberType < Types::BaseObject

  description "A Subscriber"

  field :id, ID, null: false
  field :email, String, null: false

end