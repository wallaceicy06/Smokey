class StudentsController < ApplicationController
    def index
        render json: Student.all
    end
    
    def create
        puts student_params

        @student = Student.new(student_params)

        if @student.save
            render json: @student, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
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
