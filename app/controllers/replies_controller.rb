class RepliesController < ApplicationController

	def new
	end

	def edit
	end

	def create
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
