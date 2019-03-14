class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root_if_visitor, except: [:index]

  def index
    @articles = Article.all
  end

  def show
    authorize @article
  end

  def new
    @article = Article.new
    authorize @article
  end

  def edit
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    authorize @article

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Cet article a été créé avec succès' }
      else
        format.html { render :index }
      end
    end
  end

  def update
    authorize @article
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to admin_article_path(@article), notice: 'Cet article a été mis à jour avec succès' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @article

    if @article.destroy

     flash[:notice] = "Cet article #{@article.title} a été supprimé avec succès."
      redirect_to @article
    else
      flash.now[:alert] = "Il y a eu un problème lors de la suppression de cet article."
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :for_adult, :role)
    end


end
