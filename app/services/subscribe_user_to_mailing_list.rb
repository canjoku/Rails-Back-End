class SubscribeUserToMailingList

  def initialize(email)
    self.email = email
  end

  def self.call(email)
    new(email).call
  end
  attr_accessor :email

  def call
    gibbon = Gibbon::Request.new
    gibbon.lists(ENV.fetch('MAILCHIMP_LIST_ID'))
    .members
    .create(
      body: {email_address: email, status: "subscribed",
        merge_fields: {FNAME: "First Name", LNAME: "Last Name"}
      }
    )
  end
end

