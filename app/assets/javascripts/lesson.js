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
    renewUrl(url);
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
}

//add method to the prototype
Lesson.prototype.renderLesson = function() {
  console.log("Called the lesson display method");
  $('#lessonStudentName').text(this.student);
  $('#lessonInstructorName').text(this.instructor);
  $('#lessonDescription').text(this.description);
  $('#lessonDatetime').text(this.lessonDatetime);
}

function renewUrl(url) {
  console.log('Call to renew URL');
  newUrlId = url.replace(".json", "");
  newUrl = "/lessons/" + newUrlId;
  history.replaceState(null, null, newUrl);
}
