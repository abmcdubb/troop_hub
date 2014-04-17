class NewsletterMailer < ActionMailer::Base
  default from: "from@example.com"

  def newsletter_email(user)
    @user = user
    mail(to: @user.email, subject: 'Troop Newsletter')
    @newsletter= Newsletter.new(newsletter_params)
  end

end