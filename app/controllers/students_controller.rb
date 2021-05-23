class StudentsController < ApplicationController
    # get '/students'
    def index
        @students = Student.all
        render json: @students
    end

    # get '/students/:id'
    def show
        begin
            @student = Student.find(params[:id])
            render json: @student
        rescue
            render json: {"message": "Student not found"}
        end
    end

    # post '/students'
    def create
        @student = Student.new(name: params[:name])

        if @student.save
            render json: @student
        else
            render json: {"message": "Some issue"}
        end
    end

    # delete '/students/:id'
    def destroy
        begin
            @student = Student.find(params[:id])
        
            if @student.destroy
                render json: @student
            else
                render json: {"message": "Server issue"}
            end 
        rescue 
            render json: {"message": "Student not found"}
        end
    end

    # put '/students/:id'
    def update
        begin
            @student = Student.find(params[:id])
        
            if params[:name]
                @student.name = params[:name]
            end
            
            if @student.save
                render json: @student
            else
                render json: {"message": "Some server issue"}
            end
        rescue
            render json: {"message": "Student not found"}
        end
    end

    # get '/courses/:course_id/students'
    def index 
        begin
            @course = Course.find(params[:course_id])
            @enrollments = Enrollment.find_by(course_id: @course.id)
            @students = Student.where(id: @enrollments)
            render json: @students
        rescue 
            render json: {"message": "no such course_id exists"}
        end
    end

end