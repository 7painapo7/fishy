class HistoriesController < ApplicationController
	def index
		@photos = current_user.post_images
	end

	def show
		@post_image = PostImage.find(params[:id])
	end
end
