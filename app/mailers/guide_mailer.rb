class GuideMailer < ApplicationMailer

  def guide_check_in(guide, user)
    @user = user
    @guide = guide
    @conversation = Conversation.create(sender_id: user.id, recipient_id: guide.user.id)
    @message = Message.create(body: "Bonjour j'ai besoin d'un guide pour visiter #{@guide.pays}, êtes vous disponible pour en parler ?", conversation_id: @conversation.id, user_id: user.id)
    @message.mark_as_read! for: user
    mail(
      to:       @guide.user.email,
      subject:  "Vous avez une demande en attente!"
    )
  end


end
