class InverseFriendshipsController < ApplicationController

	  def create
	    @inverse_friendship = @user.inverse_friendships.build(friend_id: params[:friend_id])
	    if @inverse_friendship.save
	      flash[:notice] = "Added friend."
	      redirect_to current_user
	    else
	      flash[:error] = "Unable to add friend."
	      redirect_to root_url
	    end
	  end


    # def show
    #   @user = User.find(params[:id])
    # end
	  
	  def destroy
	    @friendship = @user.inverse_friendships.find(params[:id])
	    @inverse_friendship.destroy
	    flash[:notice] = "Removed friendship."
	    redirect_to current_user
	  end


end