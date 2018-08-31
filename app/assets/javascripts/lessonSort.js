// sortLink ID of link

$(function() {
  $('#sortLink').on('click', function(e) {
    e.preventDefault();
    var url = $(this).attr("href")
    sortLessons(url);
  });
});


function sortLessons(url) {
  //create object to parse with attr
  // render the attr to the page  may have to iterate.
  $.get(url, function() {
  }).done(function(data) {
    var lessonPlural = data; 
    lessonsByStudent(lessonPlural);
    lessonPlural.forEach(function(lesson) {
      var newLesson = new Lesson(lesson);
      renderSortedLesson(newLesson);
    });
  });
}

// sorted by Reverse alphabetical student name
function lessonsByStudent(lessons) {
  lessons.sort(function(a, b) {
    var nameA = a.student.name.toUpperCase(); // ignore upper and lowercase
    var nameB = b.student.name.toUpperCase(); // ignore upper and lowercase
    if (nameB < nameA) {
      return -1;
    }
    if (nameB > nameA) {
      return 1;
    }
    // names must be equal
    return 0;
  });
}

