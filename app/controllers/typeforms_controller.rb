class TypeformsController < ApplicationController
  before_action :set_typeform, only: [:show]
   include TypeformsHelper

  def show
    set_typeforms
    @typeform_id = @typeforms.last.id_typeform
  end

  private
    def set_typeform
      @typeform = Typeform.find(params[:id])
    end

    def typeform_params
      params.require(:typeform).permit(:title, :description, :id_typeform, :id_results, :for_adult)
    end
end
