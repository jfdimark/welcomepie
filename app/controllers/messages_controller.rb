class MessagesController < ApplicationController
  
  before_filter :authenticate_user!

  def index
    @messages = current_user.received_messages
  end

  def show
    @message = current_user.received_messages.find(params[:id])
    @message.open
  end

  def new
     @message = ActsAsMessageable::Message.new
  end

  def create
    @to = current_user.friends.find(params[:friend_id])
    if @to.present?
      current_user.send_message(@to, params[:acts_as_messageable_message][:topic], params[:acts_as_messageable_message][:body], params[:acts_as_messageable_message][:received_messageable_id])
      redirect_to user_path(@to), notice: "Message sent"
    else
      redirect_to root_path, notice: "Error"
    end
  end

  def reply
    @message = current_user.received_messages.find(params[:id])    
    @message.reply(:topic => params[:acts_as_messageable_message][:topic], :body => params[:acts_as_messageable_message][:body])
    redirect_to message_path(@message), notice: "Sent reply!"
  end
  
  def outbox
     @messages = current_user.sent_messages
     render "index"
  end

  def destroy
    @message = current_user.messages.find(params[:id])
    if @message.destroy
      flash[:notice] = "All ok"
    else
      flash[:error] = "Fail"
    end
  end
end
