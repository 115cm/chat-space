class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  # imageカラムが空の場合、contentカラムも空であれば保存しない
  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
