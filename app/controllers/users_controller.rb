class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Signed up successfully!"
			redirect_to user_path @user
		else
			flash[:alert] = "Yo it didn't work"
			render :new
		end
	end

	def new
		@user = User.new
	end

	def edit
	end

	def show
		@user = User.find(params[:id])
	end

	def update
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			flash[:notice] = "User deleted successfully."
		else
			flash[:alert] = "There was a problem deleting this user."
		end
		redirect_to users_path
	end

	private 
	def user_params
		params.require(:user).permit(:fname, :lname, :email, :password)
	end

end
