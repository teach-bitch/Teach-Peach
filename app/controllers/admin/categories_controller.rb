class Admin::CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root_if_not_admin


  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
    authorize @category
  end

  def edit
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path, notice: 'Category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @category
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_categories_path, notice: 'Cette catégorie a été mise à jour avec succès' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @category
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_path, notice: 'La catégorie a été détruit avec succès.' }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:title)
    end
end
