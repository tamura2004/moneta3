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
    @product = Product.find_by(name: name)
    @account = Account.new(product_id: @product.id, user_id: current_user&.id)
  end
  
  def create
    @account = Account.new(accout_param)

    credit_card&.withdrow_money(@account.amount)
    credit_card&.save

    if @account.save
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
    params.require(:account).permit(:amount, :user_id, :branch_id, :product_id)
  end
end
