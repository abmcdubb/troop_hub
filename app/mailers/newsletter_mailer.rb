class NewsletterMailer < ActionMailer::Base
   default from: 'troop_hub@gmail.com'

  def newsletter_email(newsletter)
    @newsletter = newsletter
    @troop = @newsletter.troop
    mail(to: @newsletter.troop.users.pluck(:email), subject: "Newsletter")
  end

end



