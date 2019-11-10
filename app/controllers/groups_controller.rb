class GroupsController < ApplicationController
  def create
  	group = Group.new(group_params)
  	group.save
  	current_user.group_id = group.id
  	current_user.save
  end

  def update
  	user = User.find(params[:id])
    user.group_id = Group.find(current_user.group_id).id
    user.save
	flash[:notice] = "グループに追加しました。"
  end

  def destroy
  end

	private
	def group_params
		params.require(:group).permit(:group_name)
	end
end
