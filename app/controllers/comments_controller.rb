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
		@comment.user = current_user

			if @comment.save
				redirect_to project_comments_path(@project)
			else
				render :new
			end
	end

	def edit
	    @comment = Comment.find(params[:id])
	end

	def update

	  @comment = Comment.find(params[:id])

	  if @comment.update_attributes(comment_params)
	  	redirect_to project_comments_path(@project)
	  else
	    render :edit
	  end
	end


	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to project_comments_path(@project)
	end

private

	def load_project
		@project = Project.find(params[:project_id])
	end

	def comment_params
	params.require(:comment).permit(:title, :project_id, :description)
	end

end
