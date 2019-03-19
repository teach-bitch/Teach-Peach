class ApplicationController < ActionController::Base
  include Pundit
  include CurrentBasket
  before_action :current_basket
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :total_items_in_current_basket
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Def to catch all unregistered routes
  def index
    flash.notice = 'Pas de page trouvée à cette adresse !'
    redirect_to root_path
  end

  protected

  # Allow devise custom fields
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

end
