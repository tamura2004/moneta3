# 口座コントローラ
#
# @author tamuta2004@gmail.com
class AccountsController < ApplicationController
  # 新規処理の前にset_productを呼ぶ
  before_action :set_product, :set_currency, only: [:new]

  # 個別表示、解約処理の前に、set_account処理を呼ぶ
  before_action :set_account, only: [:show, :destroy]

  # ログインユーザーの口座一覧
  def index
    @accounts = current_user&.accounts
    @form = TransferForm.new
  end

  # 個別表示
  def show
  end

  # 新規口座
  def new
    @form = current_user.account_form(@product)
  end

  # 口座作成
  def create
    @form = AccountForm.new(accout_param)
    if @form.save
      redirect_to accounts_url
    else
      render :new
    end
  end

  # 口座解約
  def destroy
    if error = @account.kaiyaku
      redirect_to accounts_url, alert: error
    else
      redirect_to accounts_url, info: "#{@account.fullname}を解約しました"
    end
  end

  private

  # 口座の金融商品を取得
  def set_product
    @product = Product.find(params[:product_id])
  end

  # 口座レコードを取得
  def set_account
    @account = Account.find(params[:id])
  end

  # 通貨情報を取得
  def set_currency
    @currency = Currency.find_by(name: params[:currency]) || Currency.find_by(name: "JPY")
  end

  # 口座パラメータを取得
  def accout_param
    params.require(:account_form).permit(:amount, :start_date, :end_date, :user_id, :branch_id, :product_id, :account_id, :currency_id)
  end
end
