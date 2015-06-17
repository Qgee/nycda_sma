class StudentsController < ApplicationController

	def index
		# make active record request for all students
		# store the result in a variable called @students
		@students = Student.all
	end

	def show
	
		@student = Student.find_by_id(params[:id])
	end

end
