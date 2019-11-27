class RegulationsController < ApplicationController
  before_action :authenticate_user!
  def create
     @regulation = Regulation.new(regulation_params)
     @regulation.group_id = current_user.group.id
     # binding.pry
     @regulation.save
     flash[:notice] = "Start!!!"
     redirect_to post_images_path
  end

  def destroy
  end
  private
  def regulation_params
    params.require(:regulation).permit(:genre, :punishment, :end_time)
  end
end