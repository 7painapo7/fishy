class PostImagesController < ApplicationController
    before_action :authenticate_user!
    def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    # if @post_image.latitude == nil
    # flash[:notice] = "Cannot save because there is no location information."
    # else
    @post_image.latitude = EXIFR::JPEG::new(@post_image.fish_image.file.file).gps.latitude
    @post_image.longitude = EXIFR::JPEG::new(@post_image.fish_image.file.file).gps.longitude
    @post_image.save
    # end
    redirect_to post_images_path

    end

    def index
    @p = PostImage.new
    @group = Group.find(current_user.group_id)
    @time = Regulation.find_by(group_id: current_user.group_id)
    @group_users = User.where(group_id: current_user.group_id)
    # 同じgroup_idを持つものだけ表示
    @photos = PostImage.where(user_id: @group_users)
	end

    def show
    @post_image = PostImage.find(params[:id])
    @photos = PostImage.all
    end

    # 論理削除
    def destroy
    @group_users = User.where(group_id: current_user.group_id)
    @photos = PostImage.where(user_id: @group_users)
    @photos.destroy_all
    redirect_to histories_path
    end

    # 物理削除
    def physical_deleted
    @post_image = PostImage.find(params[:id])
    @post_image.really_destroy!
    flash[:notice] = "You have deleted image successfully."
    redirect_to post_images_path
    end




	# 投稿データのストロングパラメータ
    private
		def post_image_params
			params.require(:post_image).permit(:count, :size, :fish_name, :fish_image)
		end
end
