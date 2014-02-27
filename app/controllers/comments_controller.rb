class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end

	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find(:params[:id])
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user

			if @comment.save
				redirect_to comment_path(@comment)
			else
				render :new
			end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
	end

private

	# def load_project
	# 	@project = Project.find(params[:id])
	# end

	def comment_params
	params.require(:comment).permit(:user_id, :project_id, :description)
	end

end
