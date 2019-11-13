class RegulationsController < ApplicationController
  def create
     @regulation = Regulation.new(regulation_params)
     @regulation.group_id = current_user.group.id
     # binding.pry
     @regulation.save
     flash[:notice] = "スタート。"
     redirect_to post_images_path
  end

  def destroy
  end
  private
  def regulation_params
    params.require(:regulation).permit(:genre, :punishment, :end_time)
  end
end