class AccountsController < ApplicationController
  before_action :set_product, only: [:new]
  before_action :set_account, only: [:show, :destroy]

  def index
    @accounts = current_user&.accounts
    @form = TransferForm.new
  end

  def show
  end

  def new
    @form = current_user.account_form(@product)
  end

  def create
    @form = AccountForm.new(accout_param)
    if @form.save
      redirect_to accounts_url
    else
      render :new
    end
  end

  def destroy
    if error = @account.kaiyaku
      redirect_to accounts_url, alert: error
    else
      redirect_to accounts_url, info: "#{@account.fullname}を解約しました"
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_account
    @account = Account.find(params[:id])
  end

  def accout_param
    params.require(:account_form).permit(:amount, :start_date, :end_date, :user_id, :branch_id, :product_id, :account_id)
  end
end
