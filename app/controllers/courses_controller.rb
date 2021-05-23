class CoursesController < ApplicationController
    # get '/courses'
    def index
        @courses = Course.all
        render json: @courses
    end

    # get '/courses/:id'
    def show
        begin
            @course = Course.find(params[:id])
            render json: @course
        rescue
            render json: {"message": "Course not found"}
        end
    end

    # post '/courses'
    def create
        @course = Course.new(name: params[:name], seats: params[:seats])

        if @course.save
            render json: @course
        else
            render json: {"message": "some server issue"}
        end
    end

    # delete '/courses/:id'
    def destroy
        begin
            @course = Course.find(params[:id])
        
            if @course.destroy
                render json: { "message": "Course Deleted Successfully"}
            else
                render json: { "message": "Don't know what's the issue, figure out yourself"}
            end
        rescue
            render json: {"message": "Course not found"}
        end
    end

    # put '/courses/:id'
    def update
        begin
            @course = Course.find(params[:id])
        
            if params[:name]
                @course.name = params[:name]
            end
            if params[:seats]
                @course.seats = params[:seats]
            end
            
            if @course.save
                render json: @course
            else
                render json: {"message": "Some server issue"}
            end
        rescue
            render json: {"message": "Course not found"}
        end
    end

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
