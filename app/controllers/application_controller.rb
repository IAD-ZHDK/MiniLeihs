class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception

  def check_user(*roles)
    return true if roles.include?(session[:user])

    redirect_to :root, notice: 'Please login first!'
    false
  end
end
