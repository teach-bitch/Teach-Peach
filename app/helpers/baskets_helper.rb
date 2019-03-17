module BasketsHelper
  def set_price
    @price = 0
    @current_basket.line_items.each do |item|
      @price += (item.product.price * item.quantity)
    end
    @price = @price.round(2)
  end
end
