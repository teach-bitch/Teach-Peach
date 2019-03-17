class FacturationsController < ApplicationController
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
  end

  def update
  end

  def destroy
    @facturation.destroy
  end

  private
    def set_facturation
      @facturation = Facturation.find(params[:id])
    end

    def facturation_params
      params.require(:facturation).permit(:price)
    end

end
