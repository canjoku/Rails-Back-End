class SubscriptionMailer < ApplicationMailer

  def welcome_email(email)
    @email = email
    mail(to: @email, subject: "Welcome to TBlog")
  end

end