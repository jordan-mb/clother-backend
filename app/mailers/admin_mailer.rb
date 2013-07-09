class AdminMailer < ActionMailer::Base
  default from: "clother.me@gmail.com"

  def new_user_waiting_for_approval(user)
    @user = user
    mail(to: @user.email, subject: 'Almost There!')
  end
end
