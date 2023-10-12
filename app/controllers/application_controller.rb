class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :current_controller?, :is_admin?, :account_manager_for?, :account_manager_authorized
  
  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
  end
  
  def logged_in?
    !!current_user
  end

  def is_admin?
    current_user.kind == "admin"
  end

  def account_manager_for?(organization)
    is_admin? || current_user.id == organization.account_manager_id
  end
  
  def authorized
    unless logged_in?
      flash[:info] = "Please login first"
      redirect_to login_path
    end
  end

  def admin_authorized
    unless is_admin?
      flash[:warning] = "You have no right to do that action"
      redirect_to root_path
    end
  end

  def account_manager_authorized(organization)
    unless account_manager_for?(organization)
      flash[:warning] = "You have no right to do that action"
      redirect_to root_path
    end
  end

  def current_controller?(names)
    names.include?(controller_name)
  end
end
