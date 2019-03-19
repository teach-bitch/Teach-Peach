module CurrentBasket
	private
	def current_basket
		if user_signed_in?
				@current_basket = Basket.find_by(id: session[:basket_id]) || Basket.create(user_id: current_user.id)
				session[:basket_id] ||= @current_basket.id
		else
		end
	end

	def total_items_in_current_basket
		if user_signed_in?
			@total_items_number = 0
			@current_basket.line_items.each do |item|
				@total_items_number +=	item.quantity
			end
			return @total_items_number
		end
	end
end
