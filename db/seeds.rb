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
