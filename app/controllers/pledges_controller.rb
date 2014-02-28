class PledgesController < ApplicationController
	before_filter :load_breakpoint

	def new

	end

	def create
		Rails.logger.info(params.inspect)
		@pledge = Pledge.new
		@pledge.backer = current_user
		@pledge.project = @breakpoint.project
		@pledge.breakpoint = @breakpoint
		@pledge.active = true

	  @breakpoint_id = params[:bp_id]



		if @pledge.save
			respond_to do |format|
		 		format.html { redirect_to project_path(@breakpoint.project) }
		 		format.js
	 		end
		else
		  redirect_to project_path(@breakpoint.project)
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

	def load_breakpoint

	@breakpoint = Breakpoint.find(params[:bp_id])
end
end
