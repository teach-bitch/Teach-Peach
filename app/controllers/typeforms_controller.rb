class TypeformsController < ApplicationController
  before_action :set_typeform, only: [:show, :edit, :update, :destroy]

  # GET /typeforms
  # GET /typeforms.json
  def index
    @typeforms = Typeform.all
    
  end

  # GET /typeforms/1
  # GET /typeforms/1.json
  def show
    authorize @typeform
    # @typeform_id = Typeform.last.id_typeform
    @dynamique_typeform_id = Typeform.find(params[:id]).id_typeform

    # puts @typeform_id
    # puts "show" * 50
  end

  # GET /typeforms/new
  def new
    @typeform = Typeform.new
    authorize @typeform
  end

  # GET /typeforms/1/edit
  def edit
    authorize @typeform
  end

  # POST /typeforms
  # POST /typeforms.json
  def create
    authorize @typeform
    @typeform = Typeform.new(typeform_params)

    respond_to do |format|
      if @typeform.save
        format.html { redirect_to @typeform, notice: 'Typeform was successfully created.' }
        format.json { render :show, status: :created, location: @typeform }
      else
        format.html { render :new }
        format.json { render json: @typeform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /typeforms/1
  # PATCH/PUT /typeforms/1.json
  def update
    authorize @typeform
    respond_to do |format|
      if @typeform.update(typeform_params)
        format.html { redirect_to @typeform, notice: 'Typeform was successfully updated.' }
        format.json { render :show, status: :ok, location: @typeform }
      else
        format.html { render :edit }
        format.json { render json: @typeform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /typeforms/1
  # DELETE /typeforms/1.json
  def destroy
    authorize @typeform
    @typeform.destroy
    respond_to do |format|
      format.html { redirect_to typeforms_url, notice: 'Typeform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_typeform
      @typeform = Typeform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def typeform_params
      params.require(:typeform).permit(:title, :description, :id_typeform)
    end
end
