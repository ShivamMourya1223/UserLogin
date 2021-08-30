class LikesController < ApplicationController
	before_action :find_post
	before_action :find_like, only: [:destroy]

	def create
		#debugger
		if @comment.present? 
			if already_liked?
				flash[:notice] = "You can't like more than once"
			else
				@comment.likes.create(user_id: current_user.id)
			end
		else
			if already_liked?
				flash[:notice] = "You can't like more than once"
			else
				@like = @post.likes.create(user_id: current_user.id)
				@post = Post.find(params[:post_id])
			end
			#redirect_to post_path(@post)
		end
	end

	def destroy

		if !(already_liked?)
			flash[:notice] = "Cannot unlike"
		else
			@like.destroy
			@post = Post.find(params[:post_id])
		end
		# redirect_to post_path(@post)
	end

	private
	def find_post
		# debugger
		if params[:comment_id]
			@comment = Comment.find(params[:comment_id])
		else	
			@post = Post.find(params[:post_id])
		end
	end


	def already_liked?
		if params[:comment_id]
			Like.where(user_id: current_user.id, likeable_id:
				params[:comment_id]).exists?
		else
			Like.where(user_id: current_user.id, likeable_id:
				params[:post_id]).exists?
		end
	end

	def find_like
		@like = @post.likes.find(params[:id])
	end

end
