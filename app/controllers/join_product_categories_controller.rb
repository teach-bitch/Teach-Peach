class JoinProductCategoriesController < ApplicationController
  before_action :set_join_product_category, only: [:show, :edit, :update, :destroy]

  # GET /join_product_categories
  # GET /join_product_categories.json
  def index
    @join_product_categories = JoinProductCategory.all
  end

  # GET /join_product_categories/1
  # GET /join_product_categories/1.json
  def show
  end

  # GET /join_product_categories/new
  def new
    @join_product_category = JoinProductCategory.new
  end

  # GET /join_product_categories/1/edit
  def edit
  end

  # POST /join_product_categories
  # POST /join_product_categories.json
  def create
    @join_product_category = JoinProductCategory.new(join_product_category_params)

    respond_to do |format|
      if @join_product_category.save
        format.html { redirect_to @join_product_category, notice: 'Join product category was successfully created.' }
        format.json { render :show, status: :created, location: @join_product_category }
      else
        format.html { render :new }
        format.json { render json: @join_product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /join_product_categories/1
  # PATCH/PUT /join_product_categories/1.json
  def update
    respond_to do |format|
      if @join_product_category.update(join_product_category_params)
        format.html { redirect_to @join_product_category, notice: 'Join product category was successfully updated.' }
        format.json { render :show, status: :ok, location: @join_product_category }
      else
        format.html { render :edit }
        format.json { render json: @join_product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /join_product_categories/1
  # DELETE /join_product_categories/1.json
  def destroy
    @join_product_category.destroy
    respond_to do |format|
      format.html { redirect_to join_product_categories_url, notice: 'Join product category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_join_product_category
      @join_product_category = JoinProductCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def join_product_category_params
      params.fetch(:join_product_category, {})
    end
end
