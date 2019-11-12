class HistoriesController < ApplicationController
  def index
  	# 自分だけの釣果を表示する
  	@post_images = current_user.post_images
  end

  def new
  end

  def create
  end

  def destroy
  end
end
