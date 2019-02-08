class FeedMailer < ApplicationMailer
  def feed_mail(feed)
    @feed = feed
    mail to: @feed.user.email, subject: "feedを投稿しました"
  end
end
