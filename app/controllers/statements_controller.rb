# 取引明細コントローラ
#
# @author tamura2004@gmail.com
class StatementsController < ApplicationController
  # 一覧表示
  def index
    @account = Account.find(params[:account_id])
    @statements = @account.statements
  end
end
