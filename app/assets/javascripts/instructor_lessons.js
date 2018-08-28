// setup listener, after page load
$(function() {
  $.get('/lessons.json', function(data) {
    let currentLessons = new Lessons(data);
    // let instructorLessonsDisplay = instructorLessons.renderLessons();
  })
})

function Lessons(lesson_array) {
  console.log(lesson_array);
  // console.log(lesson_array[0]);
  let instructorLessons = lesson_array.map(function(lesson_info) {
    return new Lesson(lesson_info);
  })
  instructorLessons.forEach(function(lesson_object) {
    lesson_object.renderLesson();
  });
}
//
// // create an object from the data
// function Lesson(attributes) {
//   console.log("You called Lesson Prototype");
//   console.log(attributes);
//   this.student = attributes.student.name;
//   this.instructor = attributes.instructor.name;
//   this.description = attributes.description;
//   this.lessonDatetime = attributes.lesson_datetime;
//   this.next = attributes.next
//   this.previous = attributes.previous
// }
//
// //renderLesson method for the prototype
// Lesson.prototype.renderLesson = function() {
//   let $prev = $('#previousLesson');
//   let $next = $('#nextLesson');
//
//   $('#lessonStudentName').text(this.student);
//   $('#lessonInstructorName').text(this.instructor);
//   $('#lessonDescription').text(this.description);
//   $('#lessonDatetime').text(this.lessonDatetime);
//
//   if (this.next) {
//     $next.attr('href', `${this.next.id}.json`);
//     $next.text("Next");
//   } else {
//     $next.text("End of List");
//   }
//   if (this.previous) {
//     $prev.attr('href', `${this.previous.id}.json`);
//     $prev.text("Previous");
//   } else {
//     $prev.text("End of List");
//   }
// }
