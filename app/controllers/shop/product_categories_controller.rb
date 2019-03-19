class Shop::ProductCategoriesController < ShopController
  before_action :set_product_category, only: [:show, :edit, :update, :destroy]

  def index
    @product_categories = ProductCategory
    @products = Product.all
    @product_categories = ProductCategory.all
  end

  def show
  end

  private

    def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end

    def product_category_params
      params.require(:product_category).permit(:title)
    end

end
