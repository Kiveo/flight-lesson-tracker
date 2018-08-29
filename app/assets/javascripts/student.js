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
  let new_student = new Student(studentData);
  new_student.renderStudent();
}

function Student(attributes) {
  this.student = attributes.student.name;
  this.studentId = attributes.student.student_id;
}
Student.prototype.slogan = function() {
  // slogan = "Aviator #{self.name}, has joined our team as cadet: #{self.student_id}."
}

function renderStudent() {
  $('#studentResult').append(`<li>Hello</li>`);
  // after appending, reset form fields 
}
