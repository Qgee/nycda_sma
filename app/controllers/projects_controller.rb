class ProjectsController < ApplicationController

  before_action :authenticate

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project was saved."
      redirect_to students_path
    else
      
    end
  end


  private

  def project_params
    params.require(:project).permit(:name,:student_id)
  end

end