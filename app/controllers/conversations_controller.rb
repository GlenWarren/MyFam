class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]
  def index
    @conversations = Conversation.all
  end

  def show
  end

  def new
    @family = Family.find(params[:family_id])
    @conversation = Conversation.new
  end

  def create
    @family = Family.find(params[:family_id])
    @conversation = Conversation.new(conversation_params)
    @conversation.family = @family
    redirect_to family_conversations_path
  end

  def edit
  end

  def update
    @conversation.update(conversation_params)
  end

  def destroy
    @conversation.destroy
    redirect_to family_conversations_path(@conversation)
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.require(:conversation).permit(:name, :family_id)
  end
end
