  // after load function
  $(function() {
    $("#new_student").on('submit', function(e){
      e.preventDefault();
      // 1. capture form url
      let student_url = this.action;
      // 2. translate form data
      var studentData = {
        'authenticity_token': $("input[name='authenticity_token']").val(),
        'student': {
          'name': $('#student_name').val(),
          'student_id': $('#student_student_id').val()
        }
      }

      // use url and data to submit a post request
      var posting = $.post( student_url ,studentData , dostuff(studentData), 'json' )

    });
  });

function dostuff(studentData) {
  console.log("Did stuff");
  console.log(studentData);
}
