class GroupsController < ApplicationController

  def index
    # 罰ゲームを表示
    @regulation = Regulation.find_by(group_id: current_user.group)
  end


  def create
  	group = Group.new(group_params)
  	group.save
  	current_user.group_id = group.id
  	current_user.save

    redirect_to users_path
  end

  def show
    @group_users = User.where(group_id: current_user.group_id)
    @group = Group.find(current_user.group_id)
    # ルールを作成
    @regulation = Regulation.new
  end

  def update
  	user = User.find(params[:id])
    user.group_id = current_user.group_id
    user.save
	  flash[:notice] = "グループに追加しました。"
  end

  def sakujyo
    # グループを削除
    User.where(group_id: params[:id]).update_all(group_id: nil)
    redirect_to user_path(current_user)
    flash[:notice] = "グループを削除しました。"
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to users_path
  end

	private
	def group_params
		params.require(:group).permit(:group_name)
	end
end