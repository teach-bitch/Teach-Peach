class AdminsController < ApplicationController
	before_action :redirect_to_root_if_not_admin
	before_action :set_admin_panel_variables

	def index
	end

	def redirect_to_root_if_not_admin
   unless user_signed_in? && current_user.role == 'admin'
     flash[:alert] = "Accès refusé : vous devez faire partie du staff pour effectuer cette action."
     redirect_to root_path
   end
 end

 private

 	def set_admin_panel_variables
		@users = User.all
		@articles = Article.all
		@categories = Category.all
		@typeforms = Typeform.all
		@products = Product.all
		@product_categories = ProductCategory.all
		@facturations = Facturation.all
	end
end
