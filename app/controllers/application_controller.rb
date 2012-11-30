class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :get_unread_number

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def get_unread_number
    current_user.received_messages.where(opened: false).size if user_signed_in?
  end

end
