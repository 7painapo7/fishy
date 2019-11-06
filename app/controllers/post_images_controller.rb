class PostImagesController < ApplicationController
    def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
    end

    def index
    @post_image = PostImage.new
    @photos = PostImage.all
	end

    def show
    end

    def destroy
    end

	# 投稿データのストロングパラメータ
    private
		def post_image_params
			params.require(:post_image).permit(:count, :size, :fish_name, :fish_image)
		end
end
