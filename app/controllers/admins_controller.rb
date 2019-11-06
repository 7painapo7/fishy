class AdminsController < ApplicationController
	def index
	# @users = User.all
    # ransackの記載
	@q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
	end

	def show
	@user = User.find(params[:id])
	end

	def destroy
	@user = User.find(params[:id])
	@user.destroy
	flash[:notice] = "You have destroyed user successfully."
	redirect_to new_user_session_path
	end
	
end
