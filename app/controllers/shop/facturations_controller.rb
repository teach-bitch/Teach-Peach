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

  def new
    @facturation = Facturation.new
  end

  def edit
  end

  def create
    @facturation = Facturation.new(facturation_params)
        respond_to do |format|
          if @facturation.save
            format.html { redirect_to shop_facturation_path(@facturation), notice: 'Cette facture a été créée avec succès !' }
          else
            format.html { render :new }
          end
        end
  end

  def update
    respond_to do |format|

      if @facturation.update(facturation_params)
        format.html { redirect_to shop_facturation_path(@facturation), notice: 'Cette facture a été éditée avec succès !' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @facturation.destroy
    respond_to do |format|
      format.html { redirect_to shop_facturations_path, notice: 'Cette facture a été supprimée avec succès !' }
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
