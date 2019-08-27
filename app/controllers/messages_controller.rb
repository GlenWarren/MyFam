class MessagesController < ApplicationController
  # before_action :set_message, only:
  # after_create :broadcast_message

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @family = @conversation.family
    @message = Message.new(message_params)
    @message.conversation = @conversation
    @message.user = current_user
    if @message.save
    # ActionCable.server.broadcast("conversation_#{conversation.id}", {
    #   message: @message.to_json
    # })
      respond_to do |format|
        # HTTP request -> routes -> controller action -> view
        format.html { redirect_to conversation_path(@conversation) }
        format.js
      end
    else
      respond_to do |format|
        # This is not an http request -> view
        format.html { render 'conversations/show' }
        format.js
      end
    end
  end

  private

  # def set_message
   # @message = Message.find(params[:id])
 # end

  def message_params
    params.require(:message).permit(:content, :conversation_id, :user_id)
  end

end
