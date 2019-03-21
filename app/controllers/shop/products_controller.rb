class Shop::ProductsController < ShopController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  include ProductsHelper

  def index
    @products = Product.all
    @product_categories = ProductCategory.all
  end

  def show
    @product = Product.find(params[:id])
    @all_product = Product.all
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :quantity, :reference, :brand, images: [])
    end

end
