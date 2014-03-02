class BreakpointsController < ApplicationController
	before_filter :load_project

	  def index
	    @breakpoints = Breakpoint.all
	  end

	  def show
	    @breakpoint = Breakpoint.find(params[:id])
	  end

	  def new
	    @breakpoint = Breakpoint.new
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

	  def edit
	      @breakpoint = Breakpoint.find(params[:id])
	  end

	  def update

	    @breakpoint = Breakpoint.find(params[:id])

	    if @breakpoint.update_attributes(breakpoint_params)
	    	@breakpoint.limit ||= 0
	    	@breakpoint.save
	      redirect_to project_path(@project)
	    else
	      render :edit
	    end
	  end

	  def destroy
	  end

	  private
	  def breakpoint_params
	    params.require(:breakpoint).permit(:title, :description, :amount_in_cents, :project_id, :limit)
	  end

	  def load_project
	  	@project = Project.find(params[:project_id])
		end

end