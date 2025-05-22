class ApplicationController < ActionController::Base
  skip_forgery_protection
  before_action :authenticate_user!

  def authenticate_admin!
    unless current_user && current_user.admin?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
