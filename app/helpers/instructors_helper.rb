module InstructorsHelper
  
  def flash_message(flash)
    "<div class='field_with_errors'>#{flash}</div>"
  end

  def important_paragraph
    "<p class='important'>Important: FAA CFI number will be used for login.</p>"  
  end 

end
