class HomeController < ApplicationController
    def index
      @users = User.all
      	if user_signed_in?      	
      		@friends = current_user.friends
      	else 
      	end
      	if current_user
      		@pending_invited_by = current_user.pending_invited_by
      	else
      	end
      	if current_user
      		@pending_invited = current_user.pending_invited
      	else
      	end
    end
end
