class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('ADMIN_EMAIL')
  layout 'mailer'
end
