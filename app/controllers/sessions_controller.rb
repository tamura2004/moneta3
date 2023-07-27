# ログインコントローラ
#
# @author tamura2004@gmail.com
class SessionsController < ApplicationController
  skip_before_action :authorize

  # ログイン画面
  def new
    @page = Page.new(title: "ログイン")
    @form = SessionForm.new
  end

  # ログイン処理
  def create
    @form = SessionForm.new(session_params)
    if @form.valid?
      cookies["id_name"] = @form.id_name
      redirect_to page_url(1), notice: "ようこそ、#{current_user&.name}様"
    else
      render :new
    end
  end

  # ログアウト処理
  def destroy
    cookies.delete("id_name")
    @user = nil
    redirect_to page_url(1), notice: "ご利用ありがとうございました"
  end

  private

  def session_params
    params.require(:session_form).permit(:id_name, :password)
  end
end
