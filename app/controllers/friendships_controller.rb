	class FriendshipsController < ApplicationController

	before_filter :authenticate_user!
	
	def index
     @friends  = current_user.friends
     @messages  = current_user.received_messages
  end

  def new
     @users  = User.all :conditions => ["id != ?", current_user.id]
  end

  def create
    invitee = User.find_by_id(params[:user_id])
    if current_user.invite invitee
      redirect_to :back, :notice => "Successfully invited friend!"
    else
      redirect_to root_path, :notice => "Sorry! You can't invite that user!"
    end
  end

  def update
    inviter = User.find_by_id(params[:id])
    if current_user.approve inviter
      redirect_to :back, :notice => "Successfully confirmed friend!"
    else
      redirect_to root_path, :notice => "Sorry! Could not confirm friend!"
    end
  end
  
  def requests
     @pending_requests  = current_user.pending_invited_by
  end
  
  def invites
     @pending_invites  = current_user.pending_invited
  end

  def destroy
    user = User.find_by_id(params[:id])
    if current_user.remove_friendship user
      redirect_to :back, :notice => "Successfully removed friend!"
    else
      redirect_to root_path, :notice => "Sorry, couldn't remove friend!"
    end
  end 


  def outbox
     @messages  = current_user.sent_messages
  end



  def destroy_message
     @message  = current_user.messages.find(params[:id])
    if  @message .destroy
      flash[:notice] = "All ok"
    else
      flash[:error] = "Fail"
    end
  end

  def new_message
     @message = ActsAsMessageable::Message.new
  end

  def create_message
    @to = User.find_by_id(params[:user_id])
    current_user.send_message(@to , params[:acts_as_messageable_message][:topic], params[:acts_as_messageable_message][:body])
    redirect_to :back, notice: "Message sent"
  end
  
end
