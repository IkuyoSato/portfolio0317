class SessionsController < ApplicationController
  def new
  end

  def create
    # フォームから送信されたメアド取得し一致するユーザー検索
    @user = User.find_by(email_params)
    # ユーザーのPWが正しいか確認
    if @user && @user.authenticate(password_params[:password])
      log_in @user
      redirect_to topics_path,success:"ログインに成功しました"
    else
      flash.now[:danger]= "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, info: "ログアウトしました"
  end

  private
  def log_in(user)
    session[:user_id]=user.id
  end

  # emailのstrong_params
  def email_params
    params.require(:session).permit(:email)
  end

  # passwordのstrong_params
  def password_params
    params.require(:session).permit(:password)
  end
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
