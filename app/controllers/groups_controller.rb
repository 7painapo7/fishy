class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    # 罰ゲームを表示
      @regulation = Regulation.find_by(group_id: current_user.group)
      # 参加ユーザーを表示
      @group_users = User.where(group_id: current_user.group_id)
      post_images = PostImage.where(user_id: @group_users)


      # 優勝を決める計算
      reg = @regulation.genre

      if  reg == "size"
        @n = 0
        # 配列を作る
        sizes = Array.new
          post_images.each do |s|
          sizes << s.size
          max_sizes = sizes.max
          @winners = post_images.where(size: max_sizes)
          end

      else reg == "count"
        users_id  = Array.new
        post_images.each do |u|
        users_id << u.user_id
        end 
        # 重複を避ける
        uniq_id = users_id.uniq


        # @sに各ユーザーのcountの合計を作る
        result  = Array.new
        uniq_id.each do |i|
        @post = post_images.where(user_id: i)
        @s=0
        @post.each do |post|
        @s += post.count
        # counts.sum << post.count
        end
        result << @s
        end

        # さらに合計の配列を作る
        final = Array.new
        most = result.max
        winners = result.each_with_index.select{|num,index| num == most}
        winners.each do |w|
        @i = w[1]
        final << @i
        end

        # 合計とユーザーidの配列の順番が対応してるので特定させる処理
        @fff = Array.new
        final.each do |f|
        a = uniq_id[f]
        @fff << a
        end
      end
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
    # グループ自体を削除
    User.where(group_id: params[:id]).update_all(group_id: nil)
    redirect_to user_path(current_user)
    flash[:notice] = "グループを削除しました。"
  end

  def taisyutsu
    # グループを退出
    current_user.update_attributes(group_id: nil)
    redirect_to user_path(current_user)
    flash[:notice] = "グループから退出しました。"
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