class PledgesController < ApplicationController
	before_filter :load_project

	  def index
	    @pledges = Pledge.all
	  end

	  def create

	    @pledge = Pledge.new(pledge_params)
	    @pledge.project = @project
	    if @pledge.save
	      redirect_to pledges_path(@pledge)
	    else
	      render :new
	    end
	  end

	  def update
	  end

	  def new
	    @pledge = Pledge.new
	  end

	  def destroy
	  end

	  def show
	    @pledge = Pledge.find(params[:id])
	  end

	  def edit
	  end

	  private
	  def pledge_params
	    params.require(:pledge).permit(:title, :description, :amount_in_cents, :project_id)
	  end

	  def load_project
	  	@project = Project.find(params[:project_id])
		end

end
