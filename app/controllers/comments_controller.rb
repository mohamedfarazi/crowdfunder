class CommentsController < ApplicationController


	def show
		@comment = Comment.find(:params[:id])
	end

	def create
		@comment = @project.comments.build(comment_params)
		@comment.user_id = current_user.id

		respond_to do |format|
			if @comment.save
				format.html { redirect_to project_path(@project.id), notice: 'Comment added!'}
				format.js {}
			else
				format.html { render 'projects/show', alert: "There was an error. Your comment didn't save."}
				format.js {}
			end
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
	end

private

	def load_project
		@project = Project.find(params[:id])
	end

	def comment_params
	params.require(:comment).permit(:user_id, :project_id)
	end

end
