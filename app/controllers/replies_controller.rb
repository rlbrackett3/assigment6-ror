class RepliesController < ApplicationController

	def new
		@user = User.find(params[:user_id])
		@topic = Topic.find(params[:topic_id])
		@reply = Reply.new
	end

	def edit
	end

	def create
		@user = User.find(params[:user_id])
		@topic = Topic.find(params[:topic_id])
		@reply = @topic.replies.new(reply_params)

		if @topic.save
			@reply.user = @user #set the user on the reply, could also work for topic
			flash[:notice] = "Reply saved successfully!"
			redirect_to user_topic_path(@user, @topic)
		else
			flash[:alert] = "Something didn't work"
			render 'new'
		end
	end

	def update
	end

	def destroy
	end

	private
	def reply_params
		params.require(:reply).permit(:text)
	end

end
