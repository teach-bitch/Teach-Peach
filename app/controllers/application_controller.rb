class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :birthdate, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :birthdate, :role])
  end

  private

  # Generates not authorized exception
  def user_not_authorized
    flash[:error] = "Accès refusé."
    redirect_to (request.referrer || root_path)
  end

  def redirect_to_root_if_visitor
    unless user_signed_in?
      flash[:alert] = "Veuillez vous connecter pour effectuer cette action."
      redirect_to root_path
    end
  end

  def redirect_to_root_if_not_admin
    unless user_signed_in? && current_user.role == 'admin'
      flash[:alert] = "Accès refusé : vous devez faire partie du staff pour effectuer cette action."
      redirect_to root_path
    end
  end
end
