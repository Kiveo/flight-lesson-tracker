# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create students
students_seed = Student.create([{ name: 'Alpha' }, { name: 'Bravo' }, {name: 'Charley'}])
# create some instructors
instructors_seed = Instructor.create([
  {name: 'Instructor 1', cfi: 00123, password: 'password1'}, 
  {name: 'Instructor 2', cfi: 00234, password: 'password2'},
  {name: 'Instructor 3', cfi: 00345, password: 'password3'}
])

lessons_seed = Lesson.create([
  {instructor_id: 00123, student_id: 1, description: "Lesson 1-A", lesson_datetime: DateTime.new(2018,9,15,8)},
  {instructor_id: 00234, student_id: 2, description: "Lesson 2-A", lesson_datetime: DateTime.new(2018,8,14,7)},
  {instructor_id: 00234, student_id: 2, description: "Lesson 2-B", lesson_datetime: DateTime.new(2018,7,13,6)},
  {instructor_id: 00345, student_id: 3, description: "Lesson 3-A", lesson_datetime: DateTime.new(2017,6,12,5)},
  {instructor_id: 00345, student_id: 3, description: "Lesson 3-B", lesson_datetime: DateTime.new(2018,5,11,4)},
  {instructor_id: 00345, student_id: 3, description: "Lesson 3-C", lesson_datetime: DateTime.new(2019,4,10,3)}
])
