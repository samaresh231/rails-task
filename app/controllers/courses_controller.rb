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
end
