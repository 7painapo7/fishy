class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    # 罰ゲームを表示
    @regulation = Regulation.find_by(group_id: current_user.group)
    # 参加ユーザーを表示
    @group_users = User.where(group_id: current_user.group_id)
    post_images = PostImage.where(user_id: @group_users)
    # 優勝を決める計算

    # if Regulation.genre == "size"
    # 配列を作る
    # sizes = Array.new
    # post_images.each do |s|
    #   sizes << s.size
    # max_sizes = sizes.max
    # @winners = post_images.where(size: max_sizes)
    # binding.pry
    # end

    # else Regulation.genre == "count"
    users_id  = Array.new
    post_images.each do |p|
      users_id << p.user_id
    end

    # counts  = Array.new
    # user_id.each do |u|
    #   @posts = post_images.where(user_id: u)
    #     @post.each do |s|
    #       counts << s.count
    #     end
    # end

    counts  = Array.new
    post_images.each do |c|
      counts << c.count
    end

    sum_counts =Array.new
    counts.sum.each do |s|
      sum_counts << s.counts
    end
    max_counts = counts.max


    @winners = post_images.where(count: max_counts)
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
