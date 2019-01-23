module ApplicationHelper
  def bootstrap_class_for( flash_type )
    case flash_type
      when 'success', 'notice'
        'alert-success'
      when 'error', 'alert'
        'alert-danger'
      else
        flash_type.to_s
    end
  end

  def bootstrap_string_for( flash_type )
    case flash_type
      when "success", "notice"
        "Success"
      when "error", "alert"
        "Error!"
      else
        flash_type.to_s
    end
  end
end
