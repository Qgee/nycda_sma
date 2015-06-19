class StudentsController < ApplicationController

	def index
		# make active record request for all students
		# store the result in a variable called @students
		@students = Student.all
	end

	def show
		@student = Student.find_by_id(params[:id])
	end

	def new
		@student = Student.new
	end

	def create
		
		# Initialize a new student object with form values
		@student = Student.new(student_params)

		# Condition: if student was successfully create redirect to index view
		# and display flash message

		if @student.save
			flash[:notice] = "Student was successfully created!"
			redirect_to student_path(@student)
		else
			render :new
			# redirect_to new_student_path
		end

	end

	def edit
		@student = Student.find_by_id(params[:id])
	end

	def update
		@student = Student.find_by_id(params[:id])		

		if @student.update_attributes(student_params)
			flash[:notice] = "Student was successfully updated."
			redirect_to student_path(@student)
		else 
			render :edit
		end
	end

	def destroy
		@student = Student.find_by_id(params[:id])		
		@student.destroy
		flash[:notice] = "Student was successfully removed."
		redirect_to students_paths

	end


	private

	def student_params
		
		params.require(:student).permit(:first_name,:last_name,:phone,:email)
	end



end

