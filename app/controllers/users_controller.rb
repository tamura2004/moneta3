class UsersController < ApplicationController
  skip_before_action :authorize

  def index
    @page = Page.new(title: "ユーザー一覧")
    @users = User.all
  end

  def new
    @form = UserForm.new
  end

  def create
    @form = UserForm.new(user_params)
    if @form.save
      redirect_to users_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user_form)
      .permit(:id_name, :password, :name, :kana_name, :credit_number)
  end
end
