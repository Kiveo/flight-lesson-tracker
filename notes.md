Dev Notes
OVERVIEW: Flight lesson tracker should be able to allow instructors to plan flight lessons with students.


*Extra Features: These are possible features to be added later.
-more UI friendly css, concerning mobile
-Instrcutor sign up code to add verification to sign up.
-Admin that can delete lessons and 'lock' lessons.
student sign up and associated priviledges.
-js functionality*

*# To be enabled as a feature in further cycle. Instructors will require admin priviledges to delete lesson
# def delete
#   if logged_in?
#     @lesson = Lesson.find(params[:id])
#     if @lesson.destroy
#       flash[:notice] = "Lesson Deleted"
#       redirect root_url
#     else
#       flash[:alert] = "Failed to delete."
#       redirect_to root_url
#     end
#   else
#     redirect_to '/login'
#   end
# end*

JS functionality:
Dev Note:
--Work on known bug concerning pop ups.
