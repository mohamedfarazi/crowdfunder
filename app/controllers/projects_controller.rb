class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def update
  end

  def new
    @project = Project.new
  end

  def destroy
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
  end

  private
  def project_params
    params.require(:project).permit(:name, :user_id, :goal_in_cents, :start_date, :end_date, :description, :image)
  end
end
