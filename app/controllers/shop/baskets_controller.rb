class Shop::BasketsController < ShopController
  include BasketsHelper
  before_action :set_price

  def show
    unless @current_basket.id == Basket.find(params[:id]).id
      redirect_to root_path
    end
  end

end
