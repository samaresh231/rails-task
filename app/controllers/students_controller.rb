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

    # delete '/students/:id'
    def destroy
        begin
            @student = Student.find(params[:id])
        
            if @student.destroy
                render json: {"message": "Student successfully deleted"}
            else
                render json: {"message": "Server issue"}
            end 
        rescue 
            render json: {"message": "Student not found"}
        end
    end
end