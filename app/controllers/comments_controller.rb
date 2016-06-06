class CommentsController < ApplicationController
	before_filter :load_commentable

	def index
		@commentable = List.find(params[:list_id])
		@comments = @commentable.comments
  end

  def new
  	@comment = @commentable.comments.new
  end

  def create
  	@comment = @commentable.comments.new(comment_params)
  	if @comment.save
  		redirect_to @commentable, notice: "Comment created."
  	else
  		render :new
  	end
  end



	private

	def comment_params
    params.require(:comment).permit!
  end

	def load_commentable
		@commentable = List.find(params[:list_id])
	end

end