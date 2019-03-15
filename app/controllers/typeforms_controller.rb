class TypeformsController < ApplicationController
  before_action :set_typeform, only: [:show]

  # GET /typeforms/1
  # GET /typeforms/1.json
def index
   @typeforms = Typeform.all
end

  def show
    @typeform_id = Typeform.last.id_typeform
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_typeform
      @typeform = Typeform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def typeform_params
      params.require(:typeform).permit(:title, :description, :id_typeform, :id_results)
    end
end
