class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root_if_visitor, except: [:index, :show]


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
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @article

    if @article.destroy
      puts "#" * 50
     flash[:notice] = "\"L'article #{@article.title}\" a été supprimé avec succès."
      redirect_to @article
    else
      puts "W" *50
      flash.now[:alert] = "Il y a eu un problème lors de la suppression de l'article."
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

    def redirect_to_root_if_visitor
      unless user_signed_in?
        flash[:alert] = "Veuillez vous connecter pour effectuer cette action."
        redirect_to root_path

      end
    end
end
