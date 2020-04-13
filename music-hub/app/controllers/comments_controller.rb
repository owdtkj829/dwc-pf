class CommentsController < ApplicationController
	def create
	    @recommend = Recommend.find(params[:id])
	    @comment = @recommend.comments.build(comment_params)
	    @comment.user_id = current_user.id
	    if @comment.save
     		render :show
    	end
	end

	def destroy
		@comment = Comment.find(params[:id]) 
    	if @comment.destroy
      		render :show
    	end
	end

	private
	def comment_params
	    params.require(:comment).permit(:comment, :recommend_id,)
	end
end
