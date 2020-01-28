#更新ファイル
json.array! @users do |user|
  json.id user.id
  json.name user.name
end
