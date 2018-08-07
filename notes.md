Dev Notes
OVERVIEW: Flight lesson tracker should be able to allow instructors to plan flight lessons with students.

Models: Instructor, Lesson, Student
  <!-- a. Instructors have: Name, CFI number  --(#currency? #rating? maybe add later) -->
  <!-- b. Lessons have: Instructor(id), Student(id), When(datetime?) --(#aircraft) -->
  <!-- c. Students have: Name --(can add more later#) -->

Relationships:
  <!-- a. Instructors have many students through lessons, and have many lessons
  b. Students have many instructors through lessons, and have many lessons
  c. Lessons belong to both instructors and students -->

1.
<!-- --Create migrations and tables for the models.    -->
<!-- --Create models -->
<!-- --create associations between models -->

2.Create Routes and Controllers
<!-- --create controller files -->
-routes and basic links (home, login, sign up, logout, stu/instruct, lessons)
--Student controller and Instructor controller should allow for CRUD
--lesson controller
!!!ONLY INSTRUCTORS SHOULD SIGNUP/LOGIN!!!
!!!APP is designed for employee use and possibly student reference. Students are not intended to alter data!
:Currently, there is no User, only instructors, whom once logged in are in the session[:user_id] as such. 
-Change to ALL instructor references? lower confusion?

3. Basic layout and views

4. Allow for sessions concerning log in and log out .
  --create session controller
  --permissions? (viewer vs instructor?)

5.


*Extra Features: These are possible features to be added later.
-Instrcutor sign up code to add verification to sign up.