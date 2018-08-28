  // after load function
  $(function() {
    $("#new_student").on('submit', function(e){
      e.preventDefault();
      console.log("INTERCEPT!");
    });
  });
