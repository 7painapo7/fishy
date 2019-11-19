class HistoriesController < ApplicationController
	def index
		@photos = current_user.post_images.only_deleted
	end

	def show
		@post_image = PostImage.only_deleted.find(params[:id])
	end

	def destroy
		@post_image = PostImage.only_deleted.find(params[:id])
		@post_image.really_destroy!
		flash[:notice] = "釣果を削除しました。"
		redirect_to histories_path
	end
end
