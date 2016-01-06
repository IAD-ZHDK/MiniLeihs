class AuthenticationController < ApplicationController
  def authenticate
    if login_with_password(params[:login][:password])
      flash[:notice] = 'Successfully logged in!'
    end

    redirect_to :root
  end

  def logout
    session[:user] = 'none'
    redirect_to :root, notice: 'Successfully logged out!'
  end
end
