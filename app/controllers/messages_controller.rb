class MessagesController < ApplicationController
  before_action :authenticate_one
  expose :message

  def create
    message.helpchat_id = params[:helpchat_id]
    message.customer = current_customer if current_customer
    message.operator = current_operator if current_operator
    message.save
    MessageRelayJob.perform_later(message)
  end

  private
    def message_params
      params.require(:message).permit(:body, :owner, :helpchat_id)
    end

    def authenticate_one
      authenticate_customer! || authenticate_operator!
    end
end
