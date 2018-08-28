// setup listener, after page load
$(function() {
  $('#nextLesson').on('click', function(e) {
    e.preventDefault();
    var url = $(this).attr("href")
    nextLesson(url);
  });
})

function nextLesson(url) {
  console.log(`clicked the next link`);
  $.get(url, function(data) {
    jsLesson(data);
  })
}

// create an object from the data
function jsLesson(data) {
  console.log("You called jsLesson!");
  console.log(data);
}
