class GuideMailer < ApplicationMailer

  def guide_check_in(guide, user, message)
    @guide = guide
    @user = user
    @message = message
    @conversation = Conversation.create(sender_id: user.id, recipient_id: guide.user.id)
    n_message = Message.create(body: message, conversation_id: @conversation.id, user_id: user.id)
    n_message.mark_as_read! for: user
    mail(to: @guide.user.email, subject: 'Bienvenue sur SoGuide !')
  end


end
