class CoursesController < ApplicationController

  before_action :authenticate

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by_id(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:notice] = "Course has saved successfully"
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def edit
    @course = Course.find_by_id(params[:id])
  end

  def update
    @course = Course.find_by_id(params[:id])

    if @course.update_attributes(course_params) 
      flash[:notice] = "Course was successfully updated."
      redirect_to course_path(@course)
    else
      flash[:alert] = "Course was not updated."
      render :edit
    end

  end

  def destroy
    @course = Course.find_by_id(params[:id])
    @course.destroy
    flash[:notice] = "Course was successfully deleted."
    redirect_to courses_path
  end

private

  def course_params
    params.require(:course).permit(:name)
  end


end