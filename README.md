# README

* setup

    - Database used: mysql.

    - start mysql server in your system.

    - create a database "eLearning" by "create database eLearning" in mysql cli.

    - change username and password in database.yml.

    - bundle install

    - rails db:migration

    - rails db:seed

    - rails server

* Database tables

    - courses => for storing course name and no. of seats available.

    - students => for storing student name.

    - enrollments => for storing students enrolled in courses.

* apis

    - students_controller.rb => students crud apis

    - courses_controller.rb => courses crud apis

    - studentlists_controller.rb => api for list of all students in a course => get '/courses/:course_id/students'

    - enrollments_controller.rb => enrolling and de-enrolling apis
