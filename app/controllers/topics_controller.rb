class TopicsController < ApplicationController

	def index
		@topics = Topic.all # this will list all topics, to list justa  users topics...
		
		# if params[:user_id]
		# 	@topics = Topic.where(user_id: params[:user_id])
		# else
		# 	@topics = Topic.all
		# end
	end

	def show
		@topic = Topic.find(params[:id])
	end

	def new
		@user = User.find(params[:user_id])
		@topic = Topic.new # @topic = @user.topics.new
		# note: this only works with the nested resources, so you may want to limit access to topics 
		# in your routes file, or make a conditional here that checks for a current user.
	end

	def edit
	end

	def create
		# @user = User.find(params[:user_id]) #uncomment this
		@topic = Topic.new(topic_params) # @topic = @user.topics.new
		# note: this only works with the nested resources, so you may want to limit access to topics 
		# in your routes file, or make a conditional here that checks for a current user.
		if @topic.save
			flash[:notice] = "Topic saved successfully!"
			redirect_to topics_path
		else
			flash[:alert] = "Something didn't work"
			render 'new'
		end

	end

	def update
	end

	def destroy
		@topic = Topic.find(params[:id])
		if @topic.destroy
			flash[:notice] = "Topic deleted successfully!"
			redirect_to topics_path
		else
			flash[:alert] = "Womp womp"
			redirect to topic_path(@topic)
		end
	end

	private
	def topic_params
		params.require(:topic).permit(:title, :body)
	end

end
