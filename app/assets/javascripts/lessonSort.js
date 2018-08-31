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
    renderClean();
    lessonPlural.forEach(function(lesson) {
      var newLesson = new Lesson(lesson);
      renderSortedLesson(newLesson);
    });
    $('#sortMessage').html('<p class="important" id="sortMessage">Sorted by reverse-alphabetical student names</p>');
    $('#sortLink').hide();
  });
}

function renderClean() {
  $('#lessonsDiv').text('');
}

function renderSortedLesson(jsLesson) {
  // <li>Lesson Description: ${jsLesson.description}</li>
  $('#lessonsDiv').append(`
    <ul class="ajax-ul">
    <li>Lesson Student: ${jsLesson.student}</li>
    <li>Lesson Instructor: ${jsLesson.instructor}</li>
    <li>Lesson Scheduled: ${jsLesson.indexDate()}</li>

    <li><p><a href="/lessons/${jsLesson.id}">View Description</a></p></li>  
    <li><p><a href="/lessons/${jsLesson.id}/edit">Edit Lesson?</a></p></li>
    </ul>
  `);
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

