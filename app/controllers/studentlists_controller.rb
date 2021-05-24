class StudentlistsController < ApplicationController

    # get '/courses/:course_id/students'
    def index 
        begin
            @course = Course.find(params[:course_id])
            @enrollments = Enrollment.select('student_id').where(course_id: @course.id)
            @students = Student.where(id: @enrollments)
            render json: @students
        rescue 
            render json: {"message": "no such course_id exists"}
        end
    end
end