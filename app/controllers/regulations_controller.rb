class RegulationsController < ApplicationController
  def create
     @regulation = Regulation.new(regulation_params)
     binding.pry
     @regulation.save
     redirect_to post_images_path
  end

  def destroy
  end
  private
  def regulation_params
    params.require(:regulation).permit(:genre, :punishment)
  end
end