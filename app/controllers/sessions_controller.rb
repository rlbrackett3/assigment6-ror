class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.where(email: params[:email]).first
		if @user && @user.password == params[:password]
			session[:user_id] = @user_id
			flash[:notice] = "You are logged in!"
			redirect_to user_path @user
		else 
			flash[:alert] = "It didn't work"
			redirect_to new_session_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

end
