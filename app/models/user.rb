class User < ApplicationRecord

  # 各フォームに値が入っているか確認
  validates :name,  presence: { message: "%{value} を入力してください" }
  validates :email, presence: { message: "%{value} を入力してください" }
  validates :password, presence: { message: "%{value} を入力してください" }

  #名前の文字数制限
  validates :name, length: { maximum: 15,message: "は15字以内にしてください" }

  #メールの形式に関する制限
  validates :email, format: { with: /[A-Za-z0-9._+]+@[A-Za-z]+.[A-Za-z]/,
    message: "は~ @ ~ . ~の表現にしてください" }

    #パスワードの文字数制限
    validates :password, length: { in: 8..32, too_long: "は３２文字以内にしてください", too_short: "は８文字以上にしてください"}

    validates :password, format: { with: /(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)/,
      message: "%{value}はアルファべット（大小）と半角数字の混合にしてください" }

    #パスワードが一致しているかの確認
    # validates :password, confirmation: true
    validates :password, confirmation: { message: "とpasswordの値が一致していません" }
    # validates :password_confirmation, presence: true

  has_secure_password
  #投稿テーブル
  has_many :topics

  # いいねテーブル
  has_many :likes
  #ユーザーがいいねしたTopicデータを全て取得
  has_many :like_topics, through: :likes, source: 'topic'

  #コメントテーブル
  has_many :comments

end
