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
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user)
      .permit(:id_name, :masked_password, :name, :kana_name, :credit_number)
  end
end