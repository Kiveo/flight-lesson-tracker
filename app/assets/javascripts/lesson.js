// setup listener, after page load
$(function() {
  $('#nextLesson').on('click', function(e) {
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
    // var lessonDisplay = jslesson.renderLesson()
  });
}

// create an object from the data: Prototype for the lesson
function Lesson(attributes) {
  console.log("You called Lesson Prototype");
  console.log(attributes);
  this.student = attributes.student.name;
  this.instructor = attributes.instructor.name;
  this.description = attributes.description;
  this.lesson_datetime = attributes.lesson_datetime;
   
  console.log(this.student);
  console.log(this.instructor);
  console.log(this.description);
  console.log(this.lesson_datetime);
}
