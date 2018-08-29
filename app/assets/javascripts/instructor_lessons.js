// setup listener, after page load
$(function() {
  $.get('/lessons.json', function(data) {
    let currentLessons = new Lessons(data);
  })
})
// convert array of data into array of lesson objects
function Lessons(lesson_array) {
  let instructorLessons = lesson_array.map(function(lesson_info) {
    return new Lesson(lesson_info);
  })
  // for each lesson, create a specific ul and populate ul via prototype method
  instructorLessons.forEach(function(lesson_obj) {
    let registeredName = $('#registeredName').text()
    // only render current instructor's lessons
    if (lesson_obj.instructor == registeredName ) {
      renderMultiple(lesson_obj);
      // lesson_obj.renderLessonById();
      renderLessonById(lesson_obj);
    }
  });
}

function renderMultiple(lesson_obj) {
  let lessonNum = lesson_obj.id
  $('#jsDiv').append(`
    <ul id="lesson${lessonNum}">
    <li id="lessonStudentName${lessonNum}">${lessonNum}</li>
    <li id="lessonStudentId${lessonNum}">${lessonNum}</li>
    <li id="lessonInstructorName${lessonNum}">${lessonNum}</li>
    <li id="lessonDescription${lessonNum}">${lessonNum}</li>
    <li id="lessonDatetime${lessonNum}">${lessonNum}</li>
    </ul>
  `);
}
