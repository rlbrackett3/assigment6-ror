class TopicsController < ApplicationController

	def index
		@topics = Topic.all
	end

	def show
		@topic = Topic.find(params[:id])
	end

	def new
		@user = User.find(params[:user_id])
		@topic = Topic.new
	end

	def edit
	end

	def create
		#@user = User.find(params[:user_id])
		@topic = Topic.new(topic_params)
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
