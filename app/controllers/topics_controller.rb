class TopicsController < ApplicationController
  def index
   @topics = Topic.all.order(created_at: :desc)
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    #コメント一覧を表示するための設定
    @comments=Comment.all

    #topic/showに反映させたい場合は記述
    @comment=Comment.new
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path,success: "投稿に成功しました"
    else
      flash.now[:danger]="投稿に失敗しました"
      render :new
    end
  end

 # 削除機能の実装
  def destroy
     @topic =Topic.find(params[:id])
     # @topic =Topic.find(id: params[:id])
     @topic.destroy
     redirect_to topics_path,success: "画像を削除しました"
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :f_date, :field, :description)
  end

end
