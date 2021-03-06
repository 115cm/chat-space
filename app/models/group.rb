class Group < ApplicationRecord
  has_many :group_users
  has_many :messages
  has_many :users, through: :group_users

  validates :name, presence: true, uniqueness: true
  
  # モデルにインスタンスメソッドを定義することで、ビューの記述をシンプルにすることができる。
  def show_last_message
    if (last_message = messages.last).present?  # 投稿の有無
      if last_message.content?
        last_message.content
      else
        "画像が投稿されています"
      end
    else
      "まだメッセージはありません"
    end
  end

end
