class AdminsController < ApplicationController  
	before_action :redirect_to_root_if_not_admin  
	
	def redirect_to_root_if_not_admin
   unless user_signed_in? && current_user.role == 'admin'
     flash[:alert] = "Accès refusé : vous devez faire partie du staff pour effectuer cette action."
     redirect_to root_path
   end
 end
end

