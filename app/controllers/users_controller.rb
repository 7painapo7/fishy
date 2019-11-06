class UsersController < ApplicationController
	def index
	# @users = User.all
    # ransackの記載
	@q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
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
	@user = User.find(params[:id])
	end

	def edit
	@user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
	end

	def destroy
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :image)
	end
end
