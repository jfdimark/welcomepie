class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
     
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    
    @users = User.all
    
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to users_path, :notice => "Welcome to WelcomePie!"
    else
      redirect_to new_users_path, :alert => "Please try signing up again"
    end
  end

  def edit
  end 
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to user, :notice => "User updated."
    else
      redirect_to user, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def find_tags
    @tags = Video.tag_tokens(params[:q])
    respond_to do |format|
      format.html
      format.json { render json: @tags }
    end
  end

end