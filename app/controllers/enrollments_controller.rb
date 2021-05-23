class EnrollmentsController < ApplicationController
    # put '/students/:student_id/courses/:id'         --> student enrolling in a course
    def update
        begin
            @course = Course.find(params[:id])
            @student = Student.find(params[:student_id])

            if Enrollment.where(course_id: @course.id, student_id: @student.id).count != 0
                render json: {"message": "student already enrolled"}
                return
            end

            student_count = Enrollment.where(course_id: @course.id).count
            
            if student_count < @course.seats
                Enrollment.create(course_id: @course.id, student_id: @student.id)
                render json: {"message": "student enrolled successfully"}
            else
                render json: {"message": "seats not available"}
            end
        rescue
            render json: {"message": "Course or Student not found"}
        end
    end

    # destroy '/students/:student_id/courses/:id'     --> student de-enrolling from a course
    def destroy
        begin
            @course = Course.find(params[:id])
            @student = Student.find(params[:student_id])

            if Enrollment.where(course_id: @course.id, student_id: @student.id).count == 0
                render json: {"message": "student is not enrolled in the course"}
                return
            end

            @enrollment = Enrollment.find_by(course_id: @course.id, student_id: @student.id)
            
            if @enrollment.destroy
                render json: {"message": "Student de-enrolled successfully"}
            else
                render json: {"message": "some server issue"}
            end
        rescue
            render json: {"message": "Course or Student not found"}
        end
    end
end