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
  console.log(`clicked the next link`);
  $.get(url, function() {
    console.log("data requested");
  }).done(function(data) {
    var jslesson = new Lesson(data)
    var lessonDisplay = jslesson.renderLesson()
  });
}

// create an object from the data
function Lesson(attributes) {
  console.log("You called Lesson Prototype");
  console.log(attributes);
  this.student = attributes.student.name;
  this.instructor = attributes.instructor.name;
  this.description = attributes.description;
  this.lessonDatetime = attributes.lesson_datetime;
  this.next = attributes.next
  this.previous = attributes.previous
}

//renderLesson method for the prototype
Lesson.prototype.renderLesson = function() {
  let $prev = $('#previousLesson');
  let $next = $('#nextLesson');

  $('#lessonStudentName').text(this.student);
  $('#lessonInstructorName').text(this.instructor);
  $('#lessonDescription').text(this.description);
  $('#lessonDatetime').text(this.lessonDatetime);

  if (this.next) {
    $next.attr('href', `${this.next.id}.json`);
    $next.text("Next");
  } else {
    $next.text("End of List");
  }
  if (this.previous) {
    $prev.attr('href', `${this.previous.id}.json`);
    $prev.text("Previous");
  } else {
    $prev.text("End of List");
  }
}
