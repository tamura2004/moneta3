class PagesController < ApplicationController
  def show
    @page = Page.find_by(id: params[:id])
    @pages = @page.pages
  end

  def login
    @page = Page.new(
      title: "ログイン",
      description: "IDとパスワードを入力してください"
    )
  end

  def signin
    @page = Page.new(
      title: "サインイン",
      description: "お取引に必要な情報を入力してください"
    )
  end
end
