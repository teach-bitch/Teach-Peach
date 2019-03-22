class Admins::UsersController < AdminsController
  before_action :set_user, only: [:update, :destroy, :show]
  before_action :redirect_to_root_if_not_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to admins_user_path(@user), notice: 'Cet utilisateur a été créé avec succès' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admins_user_path(@user), notice: 'Cet utilisateur a été mis à jour avec succès' }
      else
          format.html { render :edit }
      end
    end
  end

    def destroy
    if @user.destroy
     flash[:notice] = "\"Cet utilisateur #{@user.email}\" a été supprimé avec succès."
     redirect_to admins_users_path
    else
      flash.now[:alert] = "Il y a eu un problème lors de la suppression de cet utilisateur."
      render :show
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :birthdate, :password, :password_confirmation, :role)
    end

end
