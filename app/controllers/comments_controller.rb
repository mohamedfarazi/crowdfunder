class CommentsController < ApplicationController

	before_filter :load_project

	def new
		@comment = Comment.new
	end

	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def create
		@comment = @project.comments.build(comment_params)
		@comment.user_id = current_user.id

			if @comment.save
				redirect_to project_comment_path(@project, @comment)
			else
				render :new
			end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
	end

private

	def load_project
		@project = Project.find(params[:project_id])
	end

	def comment_params
	params.require(:comment).permit(:title, :project_id, :description)
	end

end
