class HistoriesController < ApplicationController
	def index
		@photos = current_user.post_images.only_deleted
	end

	def show
		@post_image = PostImage.only_deleted.find(params[:id])
	end
end
