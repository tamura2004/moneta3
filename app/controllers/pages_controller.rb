# 画面コントローラ
#
# @author tamura2004@gmail.com
class PagesController < ApplicationController
  # ログインしていなければ処理しない
  skip_before_action :authorize

  # 個別画面の表示と子画面の取得
  def show
    @page = Page.find_by(id: params[:id])
    @pages = @page.pages
  end
end
