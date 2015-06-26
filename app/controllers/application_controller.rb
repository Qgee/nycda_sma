class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    unless current_user
      redirect_to root_path, alert: "Must be logged in to view this website!"
    end
  end

  private

  def current_user
    # inspect session hash and look for a user_id
    # if an id exists, then search the database for that id
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
