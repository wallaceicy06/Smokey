class Api::StudentsController < ApplicationController
    before_action :logged_in

    def show
        @student = Student.find(params[:id])

        render json: @student
    end

    def index
        render json: Student.all
    end
    
    def create
        @student = Student.new(student_params)

        if @student.save
            render json: @student, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def update
        @student = Student.find(params[:id])

        if @student.update_attributes(student_params)
            render json: @student, status: :ok
        else
            puts @student.errors.full_messages
            render json: @student.errors, status: :unprocessable_entity
        end
    end

    def destroy 
        @student = Student.find(params[:id])

        if @student.destroy
            head :no_content
        else
            render json: @student.errors, status: :unprocessable_entity
        end
    end

    private

    def student_params
        params.require(:student).permit(:name, :netid)
    end
end
