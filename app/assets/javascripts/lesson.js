// setup listener, after page load
$(function() {
  $('#nextLesson').on('click', function(e) {
    e.preventDefault();
    var url = $(this).attr("href")
    nextLesson(url);
  });

  $('#previousLesson').on('click', function(e) {
    e.preventDefault();
    var url = $(this).attr("href")
    nextLesson(url);
  });
})

// GET the next lesson from the controller
function nextLesson(url) {
  $.get(url, function() {
  }).done(function(data) {
    var jslesson = new Lesson(data)
    // var lessonDisplay = jslesson.renderLesson()
    renderLesson(jslesson);
  });
}

// create an object from the data
function Lesson(attributes) {
  this.id = attributes.id;
  this.student = attributes.student.name;
  this.studentId = attributes.student.student_id;
  this.instructor = attributes.instructor.name;
  this.description = attributes.description;
  this.lessonDatetime = attributes.lesson_datetime;
  this.next = attributes.next
  this.previous = attributes.previous
}

//renderLesson method for the prototype
function renderLesson(jsLesson) {
  let $prev = $('#previousLesson');
  let $next = $('#nextLesson');

  $('#lessonStudentName').text(jsLesson.student);
  $('#lessonInstructorName').text(jsLesson.instructor);
  $('#lessonDescription').text(jsLesson.description);
  $('#lessonDatetime').text(jsLesson.lessonDatetime);

  if (jsLesson.next) {
    $next.attr('href', `${jsLesson.next.id}.json`);
    $next.text("Next");
  } else {
    $next.text("End of List");
  }
  if (jsLesson.previous) {
    $prev.attr('href', `${jsLesson.previous.id}.json`);
    $prev.text("Previous");
  } else {
    $prev.text("End of List");
  }
}

//renderLesson when using Id specific <ul id="">
function renderLessonById() {
  let lessonNum = this.id
  let prettyDate = this.lessonDatetime.replace(':00.000Z', "Z").replace('T', ' @ ')

  $(`#lessonStudentName${lessonNum}`).text('Student: ' + this.student);
  $(`#lessonStudentId${lessonNum}`).text('School Student ID: ' + this.studentId);

  $(`#lessonInstructorName${lessonNum}`).text('Instructor: ' + this.instructor);
  $(`#lessonDescription${lessonNum}`).text('Description: ' + this.description);
  $(`#lessonDatetime${lessonNum}`).text('Date: ' + prettyDate);
}
