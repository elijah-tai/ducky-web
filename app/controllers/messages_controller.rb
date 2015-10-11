class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    Analytics.track(
        user_id: current_user.id,
        user_name: current_user.name, 
        event: 'Message Initiated', 
        properties: {
      })
  	@chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
  end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    Analytics.track({
      user_id: current_user.id,
      user_name: current_user.name,
      event: 'Message Sent',
      properties: {
        # Need to add message properties here
      }
      })
    redirect_to conversation_path(conversation)
  end

end