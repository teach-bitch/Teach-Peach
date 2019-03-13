module ApplicationHelper
  def bootstrap_class_flash(type)
    case type
      when 'notice' then "alert-info"
      when 'success' then "alert-success"
      when 'error' then "alert-danger"
      when 'alert' then "alert-warning"
    end
  end

  def flash_icons(type)
    case type
      when 'notice' then "travel_info"
      when 'success' then "ui-2_like"
      when 'error' then "objects_support-17"
      when 'alert' then "ui-1_bell-53"
    end
  end
end
