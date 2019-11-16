class PostImagesController < ApplicationController
    before_action :authenticate_user!
    def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id

    @post_image.latitude = EXIFR::JPEG::new(@post_image.fish_image.file.file).gps.latitude
    @post_image.longitude = EXIFR::JPEG::new(@post_image.fish_image.file.file).gps.longitude

    @post_image.save
    redirect_to post_images_path
    end

    def index
    @p = PostImage.new
    @photos = PostImage.all
    @group = Group.find(current_user.group_id)
    # 現時刻

    # 残り時間
    # レコードを取ってくる
    @time = Regulation.find_by(group_id: current_user.group_id)

    @group_users = User.where(group_id: current_user.group_id)
	end

    def show
    @post_image = PostImage.find(params[:id])
    @photos = PostImage.all
    end

    # 論理削除
    # def destroy
    # @post_image = PostImage.find(params[:id])
    # @post_image.destroy
    # flash[:notice] = "You have destroyed fishimage successfully."
    # redirect_to post_images_path
    # end

    # 物理削除
    def physical_deleted
    @post_image = PostImage.find(params[:id])
    @post_image.really_destroy!
    flash[:notice] = "You have destroyed fishimage successfully."
    redirect_to post_images_path
    end




	# 投稿データのストロングパラメータ
    private
		def post_image_params
			params.require(:post_image).permit(:count, :size, :fish_name, :fish_image)
		end
end
