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
    renderLesson(jslesson);
  });
}

// create an object from the data
class Lesson {
  constructor(attributes) {
    this.id = attributes.id;
    this.student = attributes.student.name;
    this.studentId = attributes.student.student_id;
    this.instructor = attributes.instructor.name;
    this.description = attributes.description;
    this.lessonDatetime = attributes.lesson_datetime;
    this.next = attributes.next
    this.previous = attributes.previous
  }

  prettyDate() {
    let prettyDate = this.lessonDatetime.replace(':00.000Z', " Zulu").replace('T', ' @ ');
    return prettyDate;
  }
}

// Lesson.prototype.prettyDate = function() {
// }

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
function renderLessonById(lesson_obj) {
  let lessonNum = lesson_obj.id

  $(`#lessonStudentName${lessonNum}`).text('Student: ' + lesson_obj.student);
  $(`#lessonStudentId${lessonNum}`).text('School Student ID: ' + lesson_obj.studentId);
  $(`#lessonInstructorName${lessonNum}`).text('Instructor: ' + lesson_obj.instructor);
  $(`#lessonDescription${lessonNum}`).text('Description: ' + lesson_obj.description);
  $(`#lessonDatetime${lessonNum}`).text('Date: ' + lesson_obj.prettyDate() );
}
