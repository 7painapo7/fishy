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
end
