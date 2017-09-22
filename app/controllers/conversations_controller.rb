class ConversationsController < ApplicationController
  before_action :authenticate_user!
def index
 @users = User.all
 @conversations = []
 @conversations << Conversation.where(sender_id: current_user.id)
 @conversations << Conversation.where(recipient_id: current_user.id)
 @recipient_conversations = Conversation.where(recipient_id: current_user.id)
 @sender_conversations = Conversation.where(sender_id: current_user.id)
 end
def create
 if Conversation.between(params[:sender_id],params[:recipient_id])
   .present?
    @conversation = Conversation.between(params[:sender_id],
     params[:recipient_id]).first
 else
  @conversation = Conversation.create!(conversation_params)
 end
 redirect_to conversation_messages_path(@conversation)
end


def mark_as_read_own
  conversation = Conversation.find(params[:format])
  message = Message.where(conversation_id: conversation.id)
  message.mark_as_read! :all, for: current_user
  redirect_to conversation_messages_path(conversation)
end

private
 def conversation_params
  params.permit(:sender_id, :recipient_id)
 end





end
