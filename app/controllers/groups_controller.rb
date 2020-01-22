class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
    @group.users << current_user  # グループ作成時に現在のユーザは必ず含めるため追加
  end

  def create
    @group = Group.new(group_params)
    if @group.save                    # ←保存処理がうまくいったかどうかの判定。
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new   #「render」はコントローラを経由しないため元のインスタンス変数の値が上書きされない。
    end
  end

  def edit
    @group = Group.find(params[:id])
    # @group.users << current_user  # グループ編集時に現在のユーザは必ず含めるため追加
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messages_path(@group.id), notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  private

  def group_params
    # 配列の保存を許可する場合は、キーと関連づけてバリューに「[]」と記述する。
    params.require(:group).permit(:name, user_ids: [] )
  end

end
