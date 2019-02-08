class ApplicationMailer < ActionMailer::Base
  default from: 'confirmation@feed.com'
  layout 'mailer'
end
