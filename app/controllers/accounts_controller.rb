class AccountsController < ApplicationController
  before_action :set_page, only: [:index, :show, :new]

  def index
    @accounts = Account.all
  end

  def show
  end

  def new
    name = params[:name]
    @page = Page.new(title: name)
    @branches = Branch.all
    @account = Account.new(name: name, user_id_name: cookies["id_name"])
  end
  
  def create
    @account = Account.new(accout_param)
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
