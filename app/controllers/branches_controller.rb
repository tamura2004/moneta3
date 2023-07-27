# 支店コントローラ
#
# @author tamura2004@gmail.com
class BranchesController < ApplicationController
  # 一覧、個別表示の前に、set_page処理を実施
  before_action :set_page, only: [:index, :show]

  # 一覧
  def index
    @branches = Branch.all
  end

  # 個別表示
  def show
  end

  # ページタイトルを「店舗一覧」に変更
  def set_page
    @page = Page.new(title: "店舗一覧")
  end
end
