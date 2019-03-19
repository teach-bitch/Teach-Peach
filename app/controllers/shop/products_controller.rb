class Shop::ProductsController < ShopController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  include ProductsHelper

  def index
    @products = Product.all
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
    @all_product = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to shop_product_path(@product), notice: 'Ce produit a été créé avec succès !' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to shop_product_path(@product), notice: 'Ce produit a été mis à jour avec succès !' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to shop_products_path, notice: 'Ce produit a été supprimé avec succès !' }
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :quantity, :reference, :brand)
    end

end