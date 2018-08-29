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
      var posting = $.post( student_url ,studentData , function() {
        makeStudent(studentData);
      }, 'json' )

    });
  });

function makeStudent(studentData) {
  console.log("called to make student");
  let new_student = new Student(studentData);
  new_student.renderStudent();
  console.log("end of makestudent");
}

function Student(attributes) {
  console.log("Student Object function called");
  console.log(attributes.student);
  this.student = attributes.student.name;
  this.studentId = attributes.student.student_id;
}

Student.prototype.renderStudent = function() {
  console.log("HEEEEEEEEEEEEEELLLLLLLLLLLLLOOOOOOOOO");
  $('#studentResult').append(`<li>Hello</li>`);
}
