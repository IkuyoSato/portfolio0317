class LikesController < ApplicationController
  def index
    @like_topics = current_user.like_topics.all.order(created_at: :desc)
  end

  def create
    like = Like.new
    like.user_id = current_user.id
    like.topic_id = params[:topic_id]

    if like.save
      #投稿詳細画面表示
      redirect_to topic_path(like.topic_id), success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入り登録に失敗しました'
    end
  end

  #いいねの削除
  def destroy
    like = Like.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    like.destroy
    #投稿詳細画面表示
    redirect_to topic_path(like.topic_id)
  end
end
