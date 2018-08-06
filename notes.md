Dev Notes
OVERVIEW: Flight lesson tracker should be able to allow instructors to plan flight lessons with students.

Models: Instructor, Lesson, Student
  <!-- a. Instructors have: Name, CFI number  --(#currency? #rating? maybe add later) -->
  <!-- b. Lessons have: Instructor(id), Student(id), When(datetime?) --(#aircraft) -->
  <!-- c. Students have: Name --(can add more later#) -->

Relationships:
  a. Instructors have many students through lessons, and have many lessons
  b. Students have many instructors through lessons, and have many lessons
  c. Lessons belong to both instructors and students

1.
<!-- --Create migrations and tables for the models.    -->
--Create models
--create associations between models

2.Create Routes and Controllers

3.

4.

5.
