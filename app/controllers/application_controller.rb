class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception

  def check_admin
    redirect_to :root, notice: 'Please login first!' unless admin?
  end
end
