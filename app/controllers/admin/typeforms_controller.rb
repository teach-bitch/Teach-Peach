class Admin::TypeformsController < AdminController
  before_action :set_typeform, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root_if_not_admin

  def index
    @typeforms = Typeform.all
  end

  def show
    @dynamique_typeform_id = @typeform.id_typeform
    @dynamique_results_id = @typeform.id_results
  end

  def new
    @typeform = Typeform.new
  end

  def edit
  end

  def create
    @typeform = Typeform.new(typeform_params)
    respond_to do |format|
      if @typeform.save
        format.html { redirect_to admin_typeforms_path, notice: 'Ce formulaire Typeform a été ajouté avec succès.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @typeform
    respond_to do |format|
      if @typeform.update(typeform_params)
        format.html { redirect_to admin_typeforms_path, notice: 'Ce formulaire Typeform a été mis à jour avec succès.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @typeform.destroy
    respond_to do |format|
      format.html { redirect_to admin_typeforms_path, notice: 'Ce formulaire Typeform a été détruit avec succès.' }
    end
  end

  private

    def set_typeform
      @typeform = Typeform.find(params[:id])
    end

    def typeform_params
      params.require(:typeform).permit(:title, :description, :id_typeform, :id_results)
    end
end
