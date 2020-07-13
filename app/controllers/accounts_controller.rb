class AccountsController < ApplicationController
  before_action :set_page, only: [:index, :show, :new]

  def index
    @accounts = Account.where(user_id_name: current_user&.id_name)
    @sum = @accounts.pluck(:amount).sum
  end

  def show
  end

  def new
    name = params[:name]
    @page = Page.new(title: name)
    @branches = mybank.branches
    @account = Account.new(name: name, user_id_name: current_user&.id_name)
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
    params.require(:account).permit(:name, :amount, :user_id_name, :branch_id)
  end
end
