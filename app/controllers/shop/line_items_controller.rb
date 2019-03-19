class Shop::LineItemsController < ShopController
  include BasketsHelper
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  skip_before_action :total_items_in_current_basket

  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def create
    product = Product.find(params[:product_id])
    @line_item = @current_basket.add_product(product)

    respond_to do |format|
      if @line_item.save
        total_items_in_current_basket
        format.html { redirect_to shop_basket_path(@line_item.basket), notice: 'Ce produit a été ajouté à votre panier avec succès !' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @operator = params[:operator]
    respond_to do |format|
      if  @operator == "add"
        @line_item.update(:quantity => @line_item.quantity + 1 )
        @line_item_total = @line_item.product.price * @line_item.quantity.round(2)
        set_price
        total_items_in_current_basket
        format.js
      elsif  @operator == "reduce"
        @line_item.update(:quantity => @line_item.quantity - 1)
        @line_item_total = @line_item.product.price * @line_item.quantity.round(2)
        set_price
        total_items_in_current_basket
        if @line_item.quantity == 0
          @line_item.destroy
        end
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to shop_basket_path(@line_item.basket), notice: 'Ce produit a été supprimé du panier avec succès !' }
    end
  end

  private

    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:basket_id, :product_id, :quantity)
    end

end
