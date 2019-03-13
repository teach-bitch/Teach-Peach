class Admin::UsersController < AdminsController
	def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(article_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Utilisateur créé avec succès' }
      else
        format.html { render :new }
      end
    end
  end

   def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Utilisateur mis à jour avec succès' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy

    if @User.destroy

     flash[:notice] = "\"Cet utilisateur #{@user.username}\" a été supprimé avec succès."
      redirect_to @article
    else
      flash.now[:alert] = "Il y a eu un problème lors de la suppression de cet utilisateur."
      render :show
    end
  end

end