class AccountsController < ApplicationController
  before_action :set_product, only: [:new]

  def index
    @accounts = current_user&.accounts
    @form = TransferForm.new
  end

  def show
  end

  def new
    @branches = Bank.me.branches.pluck(:name, :id)
    @accounts = current_user.accounts.not_fixed.map{|r|[r.fullname, r.id]}
    @form = AccountForm.new(product_id: @product.id, user_id: current_user.id)
  end

  def create
    @account = Account.new(accout_param)
    amount = @account.amount

    @from = Account.find(@account.account_id)
    @from.withdrow(amount)

    if @account.save
      Statement.create(amount: amount, account_id: @account.id, memo: "新規")
      redirect_to accounts_url
    else
      @branches = Branch.all
      render :new
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def accout_param
    params.require(:account).permit(:amount, :start_date, :end_date, :user_id, :branch_id, :product_id, :account_id)
  end
end
