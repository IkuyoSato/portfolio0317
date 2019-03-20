class CommentsController < ApplicationController

  def create
    @comment = Comment.new
    @comment[:body]=comment_params[:body]
    @comment[:user_id]=current_user.id
    @comment[:topic_id]=comment_params[:topic_id]
    topic_id = comment_params[:topic_id]

    if @comment.save
      #投稿詳細画面表示
      redirect_to topic_path(topic_id)
    else
      #投稿詳細画面表示
      redirect_to topic_path(topic_id), danger: "コメント投稿に失敗しました"
    end
  end

  def destroy
    @comment=Comment.find(params[:id])
    @comment.destroy
    redirect_to topics_path, danger: "コメント投稿を削除しました"
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :topic_id)
  end

end
