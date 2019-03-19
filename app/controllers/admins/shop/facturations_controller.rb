class Admins::Shop::FacturationsController < ShopController
  before_action :set_facturation, only: [:show, :destroy]

  def index
    @facturations = Facturation.all
  end

  def show
  end

  def new
    @facturation = Facturation.new
  end

  def create
    @facturation = Facturation.new(facturation_params)
        respond_to do |format|
          if @facturation.save
            format.html { redirect_to admins_shop_facturation_path(@facturation), notice: 'Cette facture a été créée avec succès !' }
          else
            format.html { render :new }
          end
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
