class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
	#groupを作成する
	@group = Group.new
	# @users = User.all
    # ransackの記載
	@q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
	end

	def add_user_to_group
	end


	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "You have updated user successfully."
			redirect_to user_path(@user.id)
		else
			render 'edit'
		end
	end

	def show
	@group = Group.new
	@user = User.find(params[:id])
	end

	def edit
	@user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
	end

	def destroy
	@user = User.find(params[:id])
	@user.destroy
	flash[:notice] = "You have destroyed user successfully."
	admins_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :image)
	end
end
