module TypeformsHelper

  def set_typeforms
    
    if !user_signed_in? || current_user.role == 'user_minor'
        @typeforms = []
        Typeform.all.each do |typeform|
          if typeform.for_adult == false
            @typeforms << typeform
          end
        end
    else 
          @typeforms = Typeform.all
    end
  end
end
