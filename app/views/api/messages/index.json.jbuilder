# 更新
json.array! @messages do |message|    # 新規の投稿は複数ある可能性があるため「array!」を使用。
  json.content message.content
  json.image message.image.url
  json.created_at message.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.user_name message.user.name
  json.id message.id
end
