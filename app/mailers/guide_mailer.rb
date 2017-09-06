class GuideMailer < ApplicationMailer
  def guide_check_in(guide)
    @guide = guide

    mail(
      to:       @guide.user.email,
      subject:  "Vous avez une demande en attente!"
    )
  end
end
