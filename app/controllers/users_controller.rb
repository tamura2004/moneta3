# 利用者コントローラ
#
# @author tamura2004@gmail.com
class UsersController < ApplicationController
  # ログインしていなければ処理されない
  skip_before_action :authorize

  # 利用者一覧
  def index
    @users = User.all
  end

  # 新規利用者
  def new
    @form = UserForm.new
  end

  # 利用者登録
  def create
    @form = UserForm.new(user_params)
    if @form.save
      redirect_to users_url
    else
      render :new
    end
  end

  private

  # 利用者のパラメータを取得
  def user_params
    params.require(:user_form)
      .permit(:id_name, :password, :name, :kana_name, :credit_number)
  end
end
