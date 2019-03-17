class Topic < ApplicationRecord
validates :user_id, presence: true
validates :f_date, presence: true
validates :field, presence: true
validates :description, presence: true
validates :image, presence: true

belongs_to :user

mount_uploader :image, ImageUploader

#いいねテーブルとの関連
has_many :likes
#投稿にいいねしたユーザーのデータを全て取得
has_many :like_users, through: :likes, source: "user"

#コメントテーブルとの関連
has_many :comments


end
