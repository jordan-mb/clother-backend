class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin
    redirect_to whoops_path unless current_user.admin
  end
end
