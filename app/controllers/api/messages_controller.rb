# 更新ファイル
class Api::MessagesController < ApplicationController
  def index
    
    # ルーティングでの設定によりparamsの中にgroup_idというキーでグループのidが入るので、これを元にDBからグループを取得
    group = Group.find(params[:group_id])
    # ajaxで送られてくる最後のメッセージのid番号を取得
    last_message_id = params[:id].to_i
    # 取得したグループでのメッセージ達から、idがlast_message_idよりも新しい(大きい)メッセージ達のみを取得
    @messages = group.messages.includes(:user).where("id > ?", last_message_id)

  end
end
