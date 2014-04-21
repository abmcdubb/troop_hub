class NewsletterMailer < ActionMailer::Base
   default from: 'emma.ife@flatironschool.com'

  def newsletter_email(newsletter)
    @newsletter = newsletter
    @troop = @newsletter.troop
    mail(to: @newsletter.troop.users.pluck(:email), subject: "Newsletter")
  end

end



