Course.delete_all
Student.delete_all
Enrollment.delete_all

Course.create({ id: 1, name: "Golang", seats: 2})
Course.create({ id: 2, name: "Python", seats: 4 })
Course.create({ id: 3, name: "Java", seats: 4 })
Course.create({ id: 4, name: "Python", seats: 8 })
Course.create({ id: 5, name: "Web Development", seats: 5 })

Student.create({ id: 1, name: "Samaresh" })
Student.create({ id: 2, name: "Ibrahim" })
Student.create({ id: 3, name: "Rawsee"})
Student.create({ id: 4, name: "Dinesh"})
Student.create({ id: 5, name: "Ahmed" })

Enrollment.create({ id: 1, course_id: 1, student_id: 1})
Enrollment.create({ id: 2, course_id: 1, student_id: 3})
Enrollment.create({ id: 3, course_id: 3, student_id: 1})
Enrollment.create({ id: 4, course_id: 3, student_id: 2})
Enrollment.create({ id: 5, course_id: 4, student_id: 1})
Enrollment.create({ id: 6, course_id: 2, student_id: 2})
Enrollment.create({ id: 7, course_id: 4, student_id: 4})
Enrollment.create({ id: 8, course_id: 3, student_id: 4})
Enrollment.create({ id: 9, course_id: 4, student_id: 3})
Enrollment.create({ id: 10, course_id: 5, student_id: 5})
