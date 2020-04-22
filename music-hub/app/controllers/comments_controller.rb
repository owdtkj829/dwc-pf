class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
	    @recommend = Recommend.find(params[:recommend_id])
	    @comment = @recommend.comments.build(comment_params)
	    @comment.user_id = current_user.id
	    if @comment.save
	       redirect_back(fallback_location: root_path)
	   	else
	   	   flash[:comment_error] = "コメントを入力もしくは150文字以内で入力してください。"
	   	   redirect_back(fallback_location: root_path)
    	end
	end

	def destroy
		@comment = Comment.find(params[:id])
    	if @comment.destroy
      	   redirect_back(fallback_location: root_path)
    	end
	end

	private
	def comment_params
	    params.require(:comment).permit(:comment, :recommend_id,)
	end
end
