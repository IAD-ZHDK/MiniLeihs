module ApplicationHelper
  def admin?
    !!session[:logged_in]
  end
end
