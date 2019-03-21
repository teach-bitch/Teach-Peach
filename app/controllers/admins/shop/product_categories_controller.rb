class Admins::Shop::ProductCategoriesController < ShopController
  before_action :set_product_category, only: [:show, :edit, :update, :destroy]

  def index
    @product_categories = ProductCategory.all
  end

  def show
  end

  def new
    @product_category = ProductCategory.new
  end

  def edit
  end

  def create
    @product_category = ProductCategory.new(product_category_params)
    respond_to do |format|
      if @product_category.save
        format.html { redirect_to admins_path, notice: 'Cette catégorie de produit a été créée avec succès !' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|

      if @product_category.update(product_category_params)
        format.html { redirect_to admins_path(@product_category), notice: 'Cette catégorie de produit a été éditée avec succès !' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product_category.destroy
    respond_to do |format|
      format.html { redirect_to admins_path, notice: 'Cette catégorie de produit a été supprimée avec succès !' }
    end
  end

  private

    def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end

    def product_category_params
      params.require(:product_category).permit(:title)
    end

end
