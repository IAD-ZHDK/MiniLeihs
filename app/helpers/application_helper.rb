module ApplicationHelper
  def admin?
    session[:user] == 'admin'
  end

  def terminal?
    session[:user] == 'terminal'
  end
end
