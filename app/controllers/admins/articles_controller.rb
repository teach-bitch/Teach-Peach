class Admins::ArticlesController < AdminsController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root_if_not_admin

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to  admins_article_path(@article), notice: 'Cet article a été créé avec succès.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to admins_article_path(@article), notice: 'Cet article a été mis à jour avec succès.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if @article.destroy

     flash[:notice] = "L'article a été supprimé avec succès."
      redirect_to admins_articles_path
    else
      flash.now[:alert] = 'Il y a eu un problème lors de la suppression de cet article.'
      render :show
    end
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :for_adult, :role)
    end

end
