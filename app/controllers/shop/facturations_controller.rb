class Shop::FacturationsController < ShopController
  before_action :set_facturation, only: [:show, :edit, :update, :destroy]

  def index
    @facturations = Facturation.all
  end

  def show
    unless current_user.id == @facturation.user_id
      redirect_to root_path
    end
  end

  private
    def set_facturation
      @facturation = Facturation.find(params[:id])
    end

    def facturation_params
      params.require(:facturation).permit(:price)
    end

end
