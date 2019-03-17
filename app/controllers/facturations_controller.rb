class FacturationsController < ApplicationController
  before_action :set_facturation, only: [:show, :edit, :update, :destroy]

  # GET /facturations
  # GET /facturations.json
  def index
    @facturations = Facturation.all
  end

  # GET /facturations/1
  # GET /facturations/1.json
  def show
  end

  # GET /facturations/new
  def new
    @facturation = Facturation.new
  end

  # GET /facturations/1/edit
  def edit
  end

  # POST /facturations
  # POST /facturations.json
  def create
    @facturation = Facturation.new(facturation_params)

    respond_to do |format|
      if @facturation.save
        format.html { redirect_to @facturation, notice: 'Facturation was successfully created.' }
        format.json { render :show, status: :created, location: @facturation }
      else
        format.html { render :new }
        format.json { render json: @facturation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facturations/1
  # PATCH/PUT /facturations/1.json
  def update
    respond_to do |format|
      if @facturation.update(facturation_params)
        format.html { redirect_to @facturation, notice: 'Facturation was successfully updated.' }
        format.json { render :show, status: :ok, location: @facturation }
      else
        format.html { render :edit }
        format.json { render json: @facturation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facturations/1
  # DELETE /facturations/1.json
  def destroy
    @facturation.destroy
    respond_to do |format|
      format.html { redirect_to facturations_url, notice: 'Facturation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facturation
      @facturation = Facturation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facturation_params
      params.require(:facturation).permit(:price)
    end
end
