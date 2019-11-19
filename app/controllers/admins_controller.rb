class AdminsController < ApplicationController
  before_action :authenticate_admin!

	def index
	# @users = User.all
    # ransackの記載
	@q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
	end

	def show
	@user = User.find(params[:id])
	@post_image = @user.post_images
	end

	def destroy
	@user = User.find(params[:id])
	@user.destroy
	flash[:notice] = "ユーザーを削除しました。"
	redirect_to admins_path
	end
end
