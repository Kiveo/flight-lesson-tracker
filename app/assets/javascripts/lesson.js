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
}

//add method to the prototype
Lesson.prototype.renderLesson = function() {
  console.log("Called the render lesson method");
  $('#lessonStudentName').text(this.student);
  $('#lessonInstructorName').text(this.instructor);
  $('#lessonDescription').text(this.description);
  $('#lessonDatetime').text(this.lessonDatetime);
  console.log(this.next.id);
  // updateLinks(this.next.id);
  $('#nextLesson').attr('href', `${this.next.id}.json`);
  $('#nextLesson').text(this.next.id)
  // $('#nextLesson').attr('href', `${this.next.id}`);
}

// function updateLinks(this.next.id) {
//   if (this.next.id > 0) {
//     $('#nextLesson').attr('href', `${this.next.id}.json`);
//     $('#nextLesson').text(this.next.id)
//   } else {
//     $('#nextLesson').attr('href', '#');
//     $('#nextLesson').text('End of Listings');
//   }
// }
