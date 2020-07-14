class AccountsController < ApplicationController
  before_action :set_page, only: [:index, :show, :new]

  def index
    @accounts = current_user&.accounts
  end

  def show
  end

  def new
    name = params[:name]
    @page = Page.new(title: name)
    @branches = mybank.branches
    @accounts = current_user.accounts.joins(:product).where("not products.is_fixed")
    @product = Product.find_by(name: name)
    @account = Account.new(product_id: @product.id, user_id: current_user&.id)
  end

  def create
    @account = Account.new(accout_param)

    amount = @account.amount

    @from = Account.find(@account.account_id)
    @from.withdrow_money(amount)
    @from.save


    if @account.save
      Statement.create(amount: amount, account_id: @from.id, memo: "引落")
      Statement.create(amount: amount, account_id: @account.id, memo: "新規")
      redirect_to accounts_url
    else
      @branches = Branch.all
      render :new
    end
  end

  private

  def set_page
    @page = Page.new(title: "取扱金融商品")
  end

  def accout_param
    params.require(:account).permit(:amount, :start_date, :end_date, :user_id, :branch_id, :product_id, :account_id)
  end
end
