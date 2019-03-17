module CurrentBasket
	private
	def current_basket
		if user_signed_in?
				@current_basket = Basket.find_by(id: session[:basket_id]) || Basket.create(user_id: current_user.id)
				session[:basket_id] ||= @current_basket.id
		else
		end
	end
end
