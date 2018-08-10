# create students
students_seed = Student.create([{ name: 'Alpha', student_id: 1 }, { name: 'Bravo', student_id: 2 }, {name: 'Charley', student_id: 3}])
# create some instructors
instructors_seed = Instructor.create([
  {name: 'Instructor 1', cfi: 123, password: 'password1'}, 
  {name: 'Instructor 2', cfi: 234, password: 'password2'},
  {name: 'Instructor 3', cfi: 345, password: 'password3'}
])

lessons_seed = Lesson.create([
  {instructor_id: 1, student_id: 1, description: "Lesson 1-A", lesson_datetime: DateTime.new(2016, 03, 15, 18, 00, 0)},
  {instructor_id: 2, student_id: 2, description: "Lesson 2-A", lesson_datetime: DateTime.new(2018, 9, 18, 01, 30, 0)},
  {instructor_id: 2, student_id: 2, description: "Lesson 2-B", lesson_datetime: DateTime.new(2018,7,13,6)},
  {instructor_id: 3, student_id: 3, description: "Lesson 3-A", lesson_datetime: DateTime.new(2017,6,12,5)},
  {instructor_id: 3, student_id: 3, description: "Lesson 3-B", lesson_datetime: DateTime.new(2018,5,11,4)},
  {instructor_id: 3, student_id: 3, description: "Lesson 3-C", lesson_datetime: DateTime.new(2019,4,10,3)}
])

report_seed1 = Report.create(title: 'Report 1', flight_hours: 11, ground_hours: 5, instructor_id: 1)
report_seed2 = Report.create(title: 'Report 2', flight_hours: 22, ground_hours: 2, instructor_id: 1)
report_seed3 = Report.create(title: 'Report 3', flight_hours: 3, ground_hours: 33, instructor_id: 1)