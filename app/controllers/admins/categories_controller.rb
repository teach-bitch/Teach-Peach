class Admins::CategoriesController < AdminsController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root_if_not_admin

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to admins_categories_path, notice: 'Cette catégorie a été créée avec succès.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admins_categories_path, notice: 'Cette catégorie a été mise à jour avec succès !' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if @category.destroy
     flash[:notice] = "La catégorie a été supprimée avec succès !"
      redirect_to admins_categories_path
    else
      flash.now[:alert] = "Il y a eu un problème lors de la suppression de cette categorie.."
      render :show
    end
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title)
    end
end
