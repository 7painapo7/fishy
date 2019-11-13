class HistoriesController < ApplicationController
  def index
  	# 自分だけの釣果を表示する
  	@post_images = current_user.post_images
    @history = History.new
  end

  def create
    # 自分だけの釣果をHistoryに保存させる
    post_images = current_user.post_images
    post_images.each do |p|
      @history = History.new
      @history.user_id = p.user_id
      @history.fish_image = p.fish_image
      @history.fish_name = p.fish_name
      @history.size = p.size
      @history.count = p.count
      @history.latitude = p.latitude
      @history.longitude = p.longitude
      @history.save
      p.destroy
    end
    redirect_to histories_path
  end

  def destroy
  end
end
