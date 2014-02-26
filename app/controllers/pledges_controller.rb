class PledgesController < ApplicationController
	# before_filter :load_breakpoint

	def new
		@pledge = Pledge.new
	end

	def create
		@pledge = Pledge.new(pledge_params)
		@pledge.backer = current_user
		@pledge.project = @breakpoint.project
		@pledge.breakpoint = @breakpoint
		@pledge.active = true

		if @pledge.save
			redirect_to project_path(@project)

		else
		  redirect_to project_path(@project)
	 end

	end

	def edit
	end

	def update
	end

	# def destroy
	# end
	private
	def pledge_params
		params.require(:pledge).permit(:project_id, :breakpoint_id, :backer_id, :active)
	end

# 	def load_breakpoint

# 	@breakpoint = Breakpoint.find(params[:project][:breakpoint_id])
# end
end
