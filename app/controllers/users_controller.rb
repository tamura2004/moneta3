class UsersController < ApplicationController
  skip_before_action :authorize

  def index
    @page = Page.new(title: "ユーザー一覧")
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    product = Product.find_by(name: "クレジットカード")
    account = product.accounts.create(amount: 0, number: params[:credit_number])
    @user = User.new(user_params)
    @user.account = account
    if @user.save
      redirect_to users_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user)
      .permit(:id_name, :masked_password, :name, :kana_name)
  end
end
