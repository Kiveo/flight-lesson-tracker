// setup listener, after page load
$(function() {
  $.get('/lessons.json', function(data) {
    let currentLessons = new Lessons(data);
  })
})

function Lessons(lesson_array) {
  let instructorLessons = lesson_array.map(function(lesson_info) {
    return new Lesson(lesson_info);
  })
  instructorLessons.forEach(function(lesson_obj) {
    renderMultiple(lesson_obj);
  });
}

function renderMultiple(lesson_obj) {
  let lessonNum = lesson_obj.id
  $('#jsDiv').append(`
    <ul id="lesson${lessonNum}"> 
    <li id="lessonStudentName${lessonNum}">${lessonNum}</li>
    <li id="lessonInstructorName${lessonNum}">${lessonNum}</li>
    <li id="lessonDescription${lessonNum}">${lessonNum}</li>
    <li id="lessonDatetime${lessonNum}">${lessonNum}</li>
    </ul>
  `);
  // console.log(lesson_obj.id)
}

// //renderLesson method for the prototype
// Lesson.prototype.renderLesson = function() {
//   let $prev = $('#previousLesson');
//   let $next = $('#nextLesson');
//
//   $('#lessonStudentName').text(this.student);
//   $('#lessonInstructorName').text(this.instructor);
//   $('#lessonDescription').text(this.description);
//   $('#lessonDatetime').text(this.lessonDatetime);
// }
