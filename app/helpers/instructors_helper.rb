module InstructorsHelper
  
  def flash_message(flash)
    "<div class='field_with_errors'>#{flash}</div>"
  end

  def important_paragraph
    "Important: FAA CFI number will be used for login."  
  end 

end

