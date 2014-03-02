class BreakpointsController < ApplicationController
	before_filter :load_project

	  def index
	    @breakpoints = Breakpoint.all
	  end

	  def create
	    @breakpoint = Breakpoint.new(breakpoint_params)
	    @breakpoint.project = @project
	    # if no limit is set on the form, assign value of 0
	    @breakpoint.limit ||= 0

	    if @breakpoint.save
	      redirect_to project_path(@project)
	    else
	      render :new
	    end
	  end

	  def update
	  end

	  def new
	    @breakpoint = Breakpoint.new
	  end

	  def destroy
	  end

	  def show
	    @breakpoint = Breakpoint.find(params[:id])
	  end

	  def edit
	  end

	  private
	  def breakpoint_params
	    params.require(:breakpoint).permit(:title, :description, :amount_in_cents, :project_id, :limit)
	  end

	  def load_project
	  	@project = Project.find(params[:project_id])
		end

end