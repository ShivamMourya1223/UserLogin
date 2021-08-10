class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end
	def create
		
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(user_id: current_user.id, post_id: @post.id, comment: params[:comment][:comment])

		# if @comment.save		
		# redirect_to post_path(@post)
   end
end
